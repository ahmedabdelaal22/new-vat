<?php

namespace App\Http\Controllers;

use App\Helper\Helper;

use App\Models\Client;
use App\Models\Inventory;
use App\Models\Item;
use App\Models\ItemCategory;
use App\Models\LeadStatus;
use App\Models\PurchaseInvoice;
use App\Models\SalesInvoice;
use App\Models\Supplier;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Facades\Excel;

class CrudController extends Controller
{

    public $model;
    public $import;
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

    public function runValidation()
    {

        $validationRequest = new $this->validationRequestClass();

        $id = $this->request->segment(2);

        $this->storeRules = $this->updateRules = $validationRequest->rules($id);

        $this->rulesMessages = $validationRequest->messages();

        return $validator = $this->validate($this->request, $this->storeRules, $this->rulesMessages);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */


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

        // filter query module responsables
        $function_exist = method_exists($this, 'initial_responsables');
        if ($function_exist) {
            $responsables_result = $this->initial_responsables($resources);
            $resources = is_null($responsables_result) ? $resources : $responsables_result;
        }


        if ($request->has('search_query')) {
            $resources = $resources->search();
        }


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

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $resource = new $this->model();

        if (view()->exists($this->basicViewFolder . '.create')) {
            if (request()->ajax()) {
                return view($this->basicViewFolder . '.create', compact('resource'))->render();
            } else {
                return view($this->basicViewFolder . '.create', compact('resource'));
            }
        }

        return " the view " . $this->basicViewFolder . ".create not found";

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store()
    {


        $this->runValidation();

        $this->request->merge(['created_by' => auth()->user()->id]);

        $data = $this->request->all();

        // return $data;

        $this->model::create($data);

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $resource = $this->model::findOrFail($id);

        if (view()->exists($this->basicViewFolder . '.show')) {
            if (request()->ajax()) {
                return view($this->basicViewFolder . '.show', compact('resource'))->render();
            } else {
                return view($this->basicViewFolder . '.show', compact('resource'));
            }
        }

        return " the view " . $this->basicViewFolder . ".show not found";
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $resource = $this->model::findOrFail($id);
        // return $resource->categories;
        if (view()->exists($this->basicViewFolder . '.edit')) {
            if (request()->ajax()) {
                return view($this->basicViewFolder . '.edit', compact('resource'))->render();
            } else {
                return view($this->basicViewFolder . '.edit', compact('resource'));
            }
        }

        return " the view " . $this->basicViewFolder . ".edit not found";
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */

    public function update($id)
    {


        $this->runValidation();

        $data = $this->request->all();

        $resource = $this->model::findOrFail($id);

        $resource->update($data);

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->model::destroy($id);
        if (request()->ajax()) {
            return Helper::responseJson(1, trans('main.deleted_successfully'), ['id' => $id]);

        } else {
            toastr()->success(trans('main.deleted_successfully'));
            return redirect()->route($this->basicRoute . '.index');
        }

    }
    function import(Request $request)
    {
     $this->validate($request, [
      'select_file'  => 'required|mimes:xls,xlsx,ods'
     ]);
    Excel::import(new $this->import, request()->file('select_file'));

     toastr()->success(trans('main.excel_data_imported_successfully'));
     return redirect()->route($this->basicRoute . '.index');
    }

    public function getAutoComplete(Request $request)
    {
        $ajax_response = [];

        if ($request->has('external_module') && !empty($request->input("external_module"))) {
            switch ($request->input("external_module")) {
                case "inventory_id":

                    $data = Inventory::where('name_'.app()->getLocale(), 'like', '%' . $request->input("q") . '%')
                     ->leftjoin('responsables as res', 'inventories.id', '=', 'res.model_id')
                    
                    ->where(function($q){  
                      if (Auth()->user() && !Auth()->user()->is_super_admin) { 
                                   $q ->where('res.model_type', '=', "App\\Models\\Inventory")
                                    ->where(function ($q) {
                                        $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                                        $q->where("res.employee_id", Auth()->user()->id);
                                        $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                                    })  ;
                            }
                    })
                   ->distinct()->select(["inventories.*"])
                    ->get();
                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;
                case "client_id":

                    $data = Client::where('name', 'like', '%' . $request->input("q") . '%')

                     ->leftjoin('responsables as res', 'clients.id', '=', 'res.model_id')
                    ->where(function($q){  
                      if (Auth()->user() && !Auth()->user()->is_super_admin) { 
                                   $q ->where('res.model_type', '=', "App\\Models\\Client")
                                    ->where(function ($q) {
                                        $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                                        $q->where("res.employee_id", Auth()->user()->id);
                                        $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                                    })  ;
                            }
                    })
                   ->distinct()->select(["clients.*"])
                    ->get();
                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;
                case "supplier_id":

                    $data = Supplier::where('name', 'like', '%' . $request->input("q") . '%')
                    ->leftjoin('responsables as res', 'suppliers.id', '=', 'res.model_id')
                    ->where(function($q){  
                      if (Auth()->user() && !Auth()->user()->is_super_admin) { 
                                   $q ->where('res.model_type', '=', "App\\Models\\Supplier")
                                    ->where(function ($q) {
                                        $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                                        $q->where("res.employee_id", Auth()->user()->id);
                                        $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                                    })  ;
                            }
                    })
                   ->distinct()->select(["suppliers.*"])
                    ->get();
                    
                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;

                case "employee_id":

                    $data = User::where('name', 'like', '%' . $request->input("q") . '%')->get();
                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;
                case "lead_status_id":

                    $data = LeadStatus::where('name_'.app()->getLocale(), 'like', '%' . $request->input("q") . '%')->get();
                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;

                case "category_id":

                    $data = ItemCategory::where('name_' . app()->getLocale(), 'like', '%' . $request->input("q") . '%')->get();
                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;

                case "cetegory_id":

                    $data = ItemCategory::where('name_' . app()->getLocale(), 'like', '%' . $request->input("q") . '%')->select(["*", "name_en as name"])->get();
                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;

                case "sale_invoice_id":

                    $data = SalesInvoice::where('code', 'like', '%' . $request->input("q") . '%') 
                    
                     -> leftjoin('responsables as res', 'sales_invoices.id', '=', 'res.model_id')
                    ->where(function($q){  
                      if (Auth()->user() && !Auth()->user()->is_super_admin) { 
                                   $q ->where('res.model_type', '=', "App\\Models\\SalesInvoice")
                                    ->where(function ($q) {
                                        $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                                        $q->where("res.employee_id", Auth()->user()->id);
                                        $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                                    })  ;
                            }
                    })
                   ->distinct()->select(["sales_invoices.id","code as name"]) 
                    ->select(["sales_invoices.id", "code as name"])->
                    get();

                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;

                case "purchase_invoice_id":

                    $data = PurchaseInvoice:: 
                    where('code', 'like', '%' . $request->input("q") . '%')->
                    orWhere("purchase_invoice_number", 'like', '%' . $request->input("q") . '%')->
                    
                     leftjoin('responsables as res', 'purchase_invoices.id', '=', 'res.model_id')
                    ->where(function($q){  
                      if (Auth()->user() && !Auth()->user()->is_super_admin) { 
                                   $q ->where('res.model_type', '=', "App\\Models\\PurchaseInvoice")
                                    ->where(function ($q) {
                                        $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                                        $q->where("res.employee_id", Auth()->user()->id);
                                        $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                                    })  ;
                            }
                    })
                   ->distinct()->select(["purchase_invoices.id","code as name"])
                     ->get();

                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;

                case "item_id":

                    $data = Item::where('name_'.app()->getLocale(), 'like', '%' . $request->input("q") . '%')
                    ->leftjoin('responsables as res', 'items.id', '=', 'res.model_id')
                    ->where(function($q){

                            if (Auth()->user() && !Auth()->user()->is_super_admin) {
           
                                $q->where('res.model_type', '=', "App\\Models\\Item")
                                ->where(function ($q) {
                                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                                    $q->where("res.employee_id", Auth()->user()->id);
                                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                                });
                            }
                    })
                    ->distinct()
                    ->select(["items.*"])
                    ->get();
                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;

                case "created_by":

                    $data = User::where('name', 'like', '%' . $request->input("q") . '%')->
                    
                     where(function($q){
                     if(!Auth()->user()->is_super_admin){
                            $q->where("team_leader_id",Auth()->user()->id);
                            $q->orWhere("manager_id",Auth()->user()->id);
                            $q->orWhere("id",Auth()->user()->id);
                        }

                    })->  


                    get();
                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;

                case "confirmed_by":

                    $data = User::where('name', 'like', '%' . $request->input("q") . '%')->

                     where(function($q){
                     if(!Auth()->user()->is_super_admin){
                            $q->where("team_leader_id",Auth()->user()->id);
                            $q->orWhere("manager_id",Auth()->user()->id);
                            $q->orWhere("id",Auth()->user()->id);
                        }

                    })->  

                    get();
                    $ajax_response["total_count"] = count($data);
                    $ajax_response["incomplete_results"] = false;
                    $ajax_response["items"] = $data;

                    break;

            }

        }

        return (json_encode($ajax_response));

    }
    public function showajaxnotfication(Request $request)
    {
        // return array_unique($this->model::get()->pluck('type')->toArray());
      $page_url= $request->page_url;
  
            if ($request->ajax()) {
                return view('layouts.' .$page_url)->render();
            }
      

        return " the view " . $this->basicViewFolder . ".index not found";

    }
}
