<?php


namespace App\Http\Controllers\Reports;

use App\Http\Controllers\Controller;
use App\Http\Controllers\InventoryItemController;
use App\Http\Requests\CollectionRequest;
use App\Models\Client;
use App\Models\Collection;
use App\Models\InventoryItem;
use App\Models\SalesInvoice;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use View;
use Session;
use File;
use PDF;


class StockAgeingController extends ReportController
{


    public function __construct(Request $request)
    {
        $this->model = new InventoryItem();
        $this->basicViewFolder = 'reports/stock_ageing_report';
        $this->basicRoute = 'reports/stock_ageing_report';

        parent::__construct();
    }

    public function export_excel(Request $request)
    {
        $resources_array = self::getQueryResults($request);

        header('Content-Type: text/html; charset=utf-8');
        return Excel::download(new BladeExport($resources_array, $this->basicRoute), 'export.csv', null, [
            'Content-Type' => 'text/html;', 'charset' => 'utf-8']);
    }

    public function export_pdf(Request $request)
    {
        $resources_array = self::getQueryResults($request);

        $data = $resources_array;
        $filePath = 'uploads/reports';
        $finalHtml = view('reports.pdf_export_stock_aging', compact('data'))->render();

        $fileName = "export_report" . '.pdf';

        $path = app_path($filePath . '/' . $fileName);

        if (file_exists($path)) {

            unlink($path);
        }

 
        $pdfOptions = [
            'title' => trans("main" . $this->basicRoute),
            'default_font' => 'ZawgyiOne',
            'orientation' => 'L',
            'format' => 'A4-L',
            'dir' => 'rtl',
            'mode' => 'utf-8', 
          
        ];

        $pdf = PDF::loadHtml($finalHtml,$pdfOptions);

        // $pdf->setPaper( array(0,0,360,360),  "landscape");

        return $pdf->stream("document.pdf");


    }

    public function initial_cols($resources)
    {
        return null;
    }

    public function initial_conditions($resources)
    {
        return null;
    }

    public function index(Request $request)
    {
        $resources = self::getQueryResults($request);
        $data = self::getPaginationData($request);


        if (view()->exists($this->basicViewFolder . '.index')) {
            if ($request->ajax()) {
                return view($this->basicViewFolder . '._table', compact('resources', "data"))->render();
            } else {
                return view($this->basicViewFolder . '.index', compact('resources', "data"));
            }
        }

        return " the view " . $this->basicViewFolder . ".index not found";
    }

    public function getQueryResults(Request $request)
    {
        $limit = 10;
        $page = 0;
        $offset = 0;

        if ($request->has('limit') && !empty($request->limit) && $request->limit != 'undefined') {
            $limit = $request->limit;
        }

        if ($request->has('page') && !empty($request->page) && $request->page != 'undefined') {
            $page = $request->page - 1;
            $offset = $page * $limit;
        }


        $year = $request->has('year') ? $request->input('year') : '2020';
        $dates_array = getReportDatesArray($year);
        $query = " select items.id,items.name_" . app()->getLocale() . " as 'item_name',items.unit_price";
        for ($i = 0; $i < count($dates_array); $i++) {
            $query .= "  ,IFNULL(table_$i.amount,0) as amount$i,IFNULL(table_$i.price,0) as price$i ";
        }
        $query .= ' from items ';

        for ($i = 0; $i < count($dates_array); $i++) {
            $query .= "  left join (
                             SELECT pii.item_id,sum(IFNULL(pii.amount,0)) as amount,sum(IFNULL(pii.price,0)) as price
                             FROM purchase_invoice_items AS pii
                             INNER JOIN purchase_invoices AS pi ON (pii.invoice_id=pi.id && pi.status ='closed')
                             WHERE pi.`date` >= '$dates_array[$i]' and pi.`date` <= ('$dates_array[$i]' + INTERVAL 1 MONTH)
                             GROUP BY pii.item_id

                        ) as table_$i on items.id=table_$i.item_id ";
        }


        $resources = DB::select("$query
          where 1=1
         " . ($request->inventory_id != null ? ' and ii.inventory_id= ' . $request->inventory_id : '') . "
         " . ($request->item_id != null ? ' and items.id= ' . $request->item_id : '') . "
         " . (($request->sortby != null) ? "order by $request->sortby" : '') . "
            limit $offset, $limit");

        return $resources;

    }

    public function getPaginationData(Request $request)
    {
        $limit = 10;
        $page = 0;
        $offset = 0;
        $year = $request->has('year') ? $request->input('year') : '2020';

        if ($request->has('limit') && !empty($request->limit) && $request->limit != 'undefined') {
            $limit = $request->limit;
        }

        if ($request->has('page') && !empty($request->page) && $request->page != 'undefined') {
            $page = $request->page - 1;
            $offset = $page * $limit;
        }


        $data["first_page"] = $offset + 1;
        $data["last_page"] = $offset + $limit;
        $data["page"] = is_null($request->page) ? 1 : $request->page;
        $data["limit"] = $limit;
        $data["total"] = $offset + $limit;
        $count = self::get_count($year)[0]->count_data;
        if ($limit <= $count) {
            $pages = $count / $limit;
        } else {
            $pages = 0;
        }
        $data["count"] = $count;
        $data["pages"] = $pages;

        return $data;
    }

    public function get_count($year)
    {

        $dates_array = getReportDatesArray($year);
        $query = " select count(items.id) as 'count_data'";

        $query .= ' from items';


        $resources = DB::select("$query");

        return $resources;
    }
}
