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


class StockReceiptReportController extends ReportController
{


    public function __construct(Request $request)
    {
        $this->model = new InventoryItem();
        $this->basicViewFolder = 'reports/stock_receipt_report';
        $this->basicRoute = 'reports/stock_receipt_report';

        parent::__construct();
    }


    public function export_excel(Request $request)
    {

        $resources_array = self::getQueryResults($request);

        header('Content-Type: text/html; charset=utf-8');
        return Excel::download(new BladeExport($resources_array), 'export.csv', null, [
            'Content-Type' => 'text/html;', 'charset' => 'utf-8']);


    }

    public function export_pdf(Request $request)
    {

        $resources_array = self::getQueryResults($request);

        $data = $resources_array;
        $filePath = 'uploads/reports';
        $finalHtml = view('reports.pdf_export', compact('data'))->render();

        $fileName = "export_report" . '.pdf';

        $path = app_path($filePath . '/' . $fileName);

        if (file_exists($path)) {

            unlink($path);
        }

        $pdfOptions = [
            'title' => trans("main" . $this->basicRoute),
            'default_font' => 'ZawgyiOne',

        ];

        $pdf = PDF::loadHTML($finalHtml, $data);

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

        $resources = DB::select("
        select ii.id as '#',inventories.name_" . app()->getLocale() . " as 'inventory_name',items.name_" . app()->getLocale() . " as 'item_name',table_b.pii_sum as \"inner\" ,table_c.sii_sum as \"outer\",(table_b.pii_sum - table_c.sii_sum) as \"result\"
       ,ii.unit_price,ii.purchase_price,ii.sale_price
        from inventory_items as ii
         left join inventories on inventories.id=ii.inventory_id
         left join items on items.id=ii.item_id

        left join
        (   select pii.inventory_id,pii.item_id,sum(pii.amount) as \"pii_sum\"
            from purchase_invoice_items pii
            inner join purchase_invoices pi
            on pii.invoice_id=pi.id and pi.status=\"closed\"
            group by pii.inventory_id,pii.item_id

        ) as table_b on  ii.inventory_id=table_b.inventory_id and ii.item_id=table_b.item_id
        left join
        (  select sii.inventory_id,sii.item_id,sum(sii.amount) as \"sii_sum\"
           from  sales_invoice_items sii
           inner join sales_invoices si on sii.invoice_id=si.id and si.status=\"closed\"
           group by sii.inventory_id,sii.item_id

        ) as table_c on ii.inventory_id=table_c.inventory_id and ii.item_id=table_c.item_id
        where 1=1
         " . ($request->inventory_id != null ? ' and ii.inventory_id= ' . $request->inventory_id : '') . "
         " . ($request->item_id != null ? ' and ii.item_id= ' . $request->item_id : '') . "
         " . (($request->sortby != null) ? "order by $request->sortby" : '') . "
            limit $offset, $limit");




        return $resources;

    }


    public function getPaginationData(Request $request)
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


        $data["first_page"] = $offset + 1;
        $data["last_page"] = $offset + $limit;
        $data["page"] = is_null($request->page) ? 1 : $request->page;
        $data["limit"] = $limit;
        $data["total"] = $offset + $limit;
        $count = self::get_count()[0]->count_data;
  
        if ($limit <= $count) {
            $pages = $count / $limit;
        } else {
            $pages = 0;
        }

 
        $data["count"] = $count;
        $data["pages"] = $pages;

        return $data;
    }

    public function get_count()
    {


        $resources = DB::select(
            DB::raw("
        select count(ii.id) as 'count_data'
from inventory_items as ii

left join

(   select pii.inventory_id,pii.item_id,sum(pii.amount) as \"pii_sum\"
    from purchase_invoice_items pii
	inner join purchase_invoices pi
    on pii.invoice_id=pi.id and pi.status=\"closed\"
    group by pii.inventory_id,pii.item_id

) as table_b on  ii.inventory_id=table_b.inventory_id and ii.item_id=table_b.item_id


left join

(  select sii.inventory_id,sii.item_id,sum(sii.amount) as \"sii_sum\"
   from  sales_invoice_items sii
   inner join sales_invoices si on sii.invoice_id=si.id and si.status=\"closed\"
   group by sii.inventory_id,sii.item_id

) as table_c on ii.inventory_id=table_c.inventory_id and ii.item_id=table_c.item_id

where 1=1
        ")

        );

        return $resources;

    }



   public function initial_responsables($resources){
        if (Auth()->user() && !Auth()->user()->is_super_admin) {
            $resources = $resources->leftjoin('responsables as res', 'inventories.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\Inventory")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupBy("inventories.id")
                ->select(["inventories.*"]);
        }

        return $resources;
    }
   
}
