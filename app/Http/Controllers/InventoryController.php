<?php

namespace App\Http\Controllers;

use App\Models\InventoryItem;
use App\Models\Responsable;
use Illuminate\Http\Request;
use App\Models\Inventory;
use App\Imports\InventoriesImport;
use App\Http\Requests\InventoryRequest;
use Illuminate\Support\Facades\DB;

class InventoryController extends CrudController
{
    public function __construct(Request $request)
    {

        $this->model = new Inventory();

        $this->import =  new InventoriesImport();
        $this->basicViewFolder = 'inventories';
        $this->basicRoute = 'inventories';
        $this->request = $request;

        $this->validationRequestClass = new InventoryRequest();

        parent::__construct();
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


    public function store()
    {


        $this->runValidation();

        $this->request->merge(['created_by' => auth()->user()->id]);

        $data = $this->request->all();



        DB::beginTransaction();

        $resource = $this->model::create($data);

        // save responsables
        Responsable::where('model_type', 'App\Models\Inventory')->where("model_id", $resource->id)->delete();
        if (!empty($this->request->responsables)) {
            foreach ($this->request->responsables as $responsable) {

                Responsable::create([
                    'employee_id' => $responsable,
                    'model_id' => $resource->id,
                    'model_type' => 'App\Models\Inventory'
                ]);

            }
        }

        DB::commit();


        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');
    }


    public function destroy($id)
    {
 
     
       $itemcount= InventoryItem::where('inventory_id',$id)->count();
       if($itemcount > 0 ){
        $response = [
	        'status' => (int)0,
	        'message' => trans('main.deleted_item_before_delted_inventory'),
	        'data' => [],
	    ];
        return response()->json($response);
       }else{
        Responsable::where('model_type', 'App\Models\Inventory')->where("model_id", $id)->delete();
        return parent::destroy($id);
       }

    }
    public function update($id)
    {


        $this->runValidation();

        $data = $this->request->all();

        $resource = $this->model::findOrFail($id);


        DB::beginTransaction();

        $resource->update($data);

        // save responsables
        Responsable::where('model_type', 'App\Models\Inventory')->where("model_id", $resource->id)->delete();
        if (!empty($this->request->responsables)) {
            foreach ($this->request->responsables as $responsable) {


                Responsable::create([
                    'employee_id' => $responsable,
                    'model_id' => $resource->id,
                    'model_type' => 'App\Models\Inventory'
                ]);

            }
        }

        DB::commit();

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');
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
