<?php

namespace App\Http\Controllers\Reports;

use App\Helper\Helper;

use App\Http\Controllers\Controller;
use App\Models\Client;
use App\Models\Inventory;
use App\Models\Item;
use App\Models\ItemCategory;
use App\Models\LeadStatus;
use App\Models\PurchaseInvoice;
use App\Models\SalesInvoice;
use App\Models\Supplier;
use App\Models\User;
use Hamcrest\Core\IsNull;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Facades\Excel;
use View;
use Session;
use File;
use PDF;

class ReportController extends Controller
{

    public $model;
    public $basicViewFolder;
    public $storeRules = [];
    public $updateRules = [];
    public $rulesMessages = [];
    public $request;
    public $basicRoute;
    public $validationRequestClass;


    public function __construct()
    {
        view::share('model', $this->model);
        view::share('basicRoute', $this->basicRoute);
        view::share('basicViewFolder', $this->basicViewFolder);


    }

    public function index(Request $request)
    {
        // return array_unique($this->model::get()->pluck('type')->toArray());

        $limit = 10;
        $page = 10;
        $sortby = 'id';
        $sorttype = 'Desc';

        if ($request->has('limit') && !empty($request->limit) && $request->limit != 'undefined') {
            $limit = $request->limit;
        }

        if ($request->has('page') && !empty($request->page) && $request->page != 'undefined') {
            $page = $request->page;
        }


        if ($request->has('sortby') && !empty($request->sortby) && $request->sortby != 'undefined') {
            $sortby = $request->sortby;
        }

        if ($request->has('sorttype') && !empty($request->sorttype) && $request->sorttype != 'undefined') {
            $sorttype = $request->sorttype;
        }


        $resources = $this->model; 
        $resources = $resources->search();

        // filter query module responsables
        $function_exist = method_exists($this, 'initial_responsables');
        if ($function_exist) {
            $responsables_result = $this->initial_responsables($resources);
            $resources = is_null($responsables_result) ? $resources : $responsables_result;
        }


        // set module conditions
        $resources = is_null($this->initial_conditions($resources))?$resources:$this->initial_conditions($resources);

        if (isset($this->model->table)) {
            $resources = $resources->orderBy($this->model->table . '.' . $sortby, $sorttype);
        } else {
            $resources = $resources->orderBy($sortby, $sorttype);
        }

        $resources = $resources->paginate($limit);

        // return $resources;

        $resources->setPath($request->fullUrl());


        if (view()->exists($this->basicViewFolder . '.index')) {
            if ($request->ajax()) {
                return view($this->basicViewFolder . '._table', compact('resources'))->render();
            } else {
                return view($this->basicViewFolder . '.index', compact('resources'));
            }
        }

        return " the view " . $this->basicViewFolder . ".index not found";

    }

    public function export_excel(Request $request)
    {

        $resources = $this->model;
           
        $resources = $resources->search();


          // filter query module responsables
        $function_exist = method_exists($this, 'initial_responsables');
        if ($function_exist) {
            $responsables_result = $this->initial_responsables($resources);
            $resources = is_null($responsables_result) ? $resources : $responsables_result;
        }
 
        $resources = is_null($this->initial_conditions($resources))?$resources:$this->initial_conditions($resources);
        $resources = $resources->get();
      

        $resources_array = $this->initial_cols($resources);

        header('Content-Type: text/html; charset=utf-8');
        return Excel::download(new BladeExport($resources_array), 'export.csv', null, [
            'Content-Type' => 'text/html;', 'charset' => 'utf-8']);


    }

    public function export_pdf(Request $request)
    {

        $resources = $this->model;

        $resources = $resources->search();

          // filter query module responsables
        $function_exist = method_exists($this, 'initial_responsables');
        if ($function_exist) {
            $responsables_result = $this->initial_responsables($resources);
            $resources = is_null($responsables_result) ? $resources : $responsables_result;
        }


        $resources = is_null($this->initial_conditions($resources))?$resources:$this->initial_conditions($resources);

        $resources = $resources->get();

        $resources_array = $this->initial_cols($resources);


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
}


// interface for excel exporting
class BladeExport implements FromView
{


    private $data;
    public  $basicRoute ;

    public function __construct($data, $basicRoute=null)
    {
        $this->data = $data;
        $this->basicRoute = $basicRoute;
    }

    public function view(): \Illuminate\Contracts\View\View
    {



       if(isset($this->basicRoute) && str_contains($this->basicRoute,"reports/stock_ageing_report")){

        return view('reports.excel_export_stock_aging', [
            'data' => $this->data
        ]);

    }else{

        return view('reports.excel_export', [
            'data' => $this->data
        ]);



    }


    }
}
