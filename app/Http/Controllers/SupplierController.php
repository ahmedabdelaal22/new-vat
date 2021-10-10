<?php

namespace App\Http\Controllers;

use App\Models\Responsable;
use Illuminate\Http\Request;
use App\Models\Supplier;
use App\Http\Requests\SupplierRequest;

class SupplierController extends CrudController
{
    public function __construct(Request $request)
    {

        $this->model = new Supplier();
        $this->basicViewFolder = 'suppliers';
        $this->basicRoute = 'suppliers';
        $this->request = $request;

        $this->validationRequestClass = new SupplierRequest();

        parent::__construct();
    }

    public function store()
    {
        $this->runValidation();

        $data = $this->request->all();
        $data['balance'] = ($this->request->has('initial_balance') && !empty($this->request->initial_balance)) ? $this->request->initial_balance : 0;

        $resource = $this->model::create($data);


        // save responsables
        Responsable::where('model_type', 'App\Models\Supplier')->where("model_id", $resource->id)->delete();
        if (!empty($this->request->responsables)) {
            foreach ($this->request->responsables as $responsable) {

                Responsable::create([
                    'employee_id' => $responsable,
                    'model_id' => $resource->id,
                    'model_type' => 'App\Models\Supplier'
                ]);

            }

        }


        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');
    }

    public function update($id)
    {

        $this->runValidation();

        $data = $this->request->all();


        $resource = $this->model::findOrFail($id);


        // save responsables
        Responsable::where('model_type', 'App\Models\Supplier')->where("model_id", $resource->id)->delete();
        if (!empty($this->request->responsables)) {
            foreach ($this->request->responsables as $responsable) {

                Responsable::create([
                    'employee_id' => $responsable,
                    'model_id' => $resource->id,
                    'model_type' => 'App\Models\Supplier'
                ]);

            }

        }

        $data['balance'] = ($this->request->has('initial_balance') && !empty($this->request->initial_balance)) ? ($this->request->initial_balance + ($resource->balance - $resource->initial_balance)) : ($resource->balance - $resource->initial_balance);

        $resource->update($data);

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');
    }
    public function destroy($id)
    {
        Responsable::where('model_type', 'App\Models\Supplier')->where("model_id", $id)->delete();
        return parent::destroy($id);
    }
    public function initial_responsables($resources)
    {
        if (Auth()->user() && !Auth()->user()->is_super_admin) {
            $resources = $resources->leftjoin('responsables as res', 'suppliers.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\Supplier")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupby("suppliers.id")
                ->select(["suppliers.*"]);
        }

        return $resources;
    }

}
