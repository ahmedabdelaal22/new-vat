<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use App\Models\Responsable;
use App\Http\Requests\UserRequest;
use App\Helper\Helper;

class UserController extends CrudController
{

    public function __construct(Request $request)
    {

        $this->model = new User();
        $this->basicViewFolder = 'users';
        $this->basicRoute = 'users';
        $this->request = $request;

        $this->validationRequestClass = new UserRequest();

        parent::__construct();
    }

    public function store()
    {
        $this->runValidation();
        // return $this->request->all();
        $data = $this->request->except('image', 'password');

        if ($this->request->hasFile('image')) {
            $data['image'] = Helper::saveImage($this->request->image, '/user');
        }
        if ($this->request->has('password') && !empty($this->request->password)) {
            $data['password'] = bcrypt($this->request->password);
        }

        if ($this->request->has('is_super_admin') && !empty($this->request->is_super_admin) && $this->request->is_super_admin) {
            $data['is_super_admin'] = 1;
        } else {
            $data['is_super_admin'] = 0;
        }

        if ($this->request->has('is_manager') && !empty($this->request->is_manager) && $this->request->is_manager) {
            $data['is_manager'] = 1;
        } else {
            $data['is_manager'] = 0;
        }

        if ($this->request->has('is_team_leader') && !empty($this->request->is_team_leader) && $this->request->is_team_leader) {
            $data['is_team_leader'] = 1;
        } else {
            $data['is_team_leader'] = 0;
        }

        $resource = $this->model::create($data);
        $resource->syncRoles($this->request->role_id);


        // save responsables
        Responsable::where('model_type', 'App\Models\User')->where("model_id", $resource->id)->delete();
        
        if (!empty($this->request->responsables)) {
            foreach ($this->request->responsables as $responsable) {

                Responsable::create([
                    'employee_id' => $responsable,
                    'model_id' => $resource->id,
                    'model_type' => 'App\Models\User'
                ]); 
            } 
        }

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');
    }


    public function update($id)
    {
        $this->runValidation();
        // return $this->request->all();
        $validator = $this->validate($this->request, $this->updateRules, $this->rulesMessages);

        $data = $this->request->except('image', 'password');

        if ($this->request->hasFile('image')) {
            $data['image'] = Helper::saveImage($this->request->image, '/user');
        }

        if ($this->request->has('password') && !empty($this->request->password)) {
            $data['password'] = bcrypt($this->request->password);
        }


        if ($this->request->has('is_super_admin') && !empty($this->request->is_super_admin) && $this->request->is_super_admin) {
            $data['is_super_admin'] = 1;
        } else {
            $data['is_super_admin'] = 0;
        }
        if ($this->request->has('is_manager') && !empty($this->request->is_manager) && $this->request->is_manager) {
            $data['is_manager'] = 1;
        } else {
            $data['is_manager'] = 0;
        }

        if ($this->request->has('is_team_leader') && !empty($this->request->is_team_leader) && $this->request->is_team_leader) {
            $data['is_team_leader'] = 1;
        } else {
            $data['is_team_leader'] = 0;
        }


        // return $data;

        $resource = $this->model::findOrFail($id);
        $resource->syncRoles($this->request->role_id);


           // save responsables
        Responsable::where('model_type', 'App\Models\User')->where("model_id", $resource->id)->delete();
        if (!empty($this->request->responsables)) {
            foreach ($this->request->responsables as $responsable) {

                Responsable::create([
                    'employee_id' => $responsable,
                    'model_id' => $resource->id,
                    'model_type' => 'App\Models\User'
                ]); 
            } 
        }

        $resource->update($data);

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');
    }

    public function profile(Request $request)
    {
        $resource = User::findOrFail(Auth()->user()->id);
        $operations = $resource->operations()->paginate(10); //TODO: for show/hide the data

        return view($this->basicRoute . '.profile', compact('resource', 'operations'));
    }

    public function update_profile($id, Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:191',
            'email' => 'required|email|max:191|unique:users,email,' . $id,
            'password' => 'nullable|confirmed',

        ]);

        $requests = $request->except('image', 'password');

        if (!empty($request->password) || $request->password != null) {
            $requests['password'] = bcrypt($request->password);;
        }

        $user = User::findOrFail($id);


        $user->update($requests);

        toastr()->success(trans('main.saved_successfully'));


        return redirect()->route('profile');
    }

    public function update_image($id, Request $request)
    {
        $this->validate($request, [
            'image' => 'required|image'

        ]);

        $requests = $request->except('password');

        if ($request->hasFile('image')) {
            $requests['image'] = saveImage($request->image, '/admins');
        }


        $user = User::findOrFail($id);


        $user->update($requests);

        toastr()->success(trans('main.saved_successfully'));
        return redirect()->route('profile');
    }


    public function initial_responsables($resources){
        if (Auth()->user() && !Auth()->user()->is_super_admin) {
            $resources = $resources->leftjoin('responsables as res', 'users.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\User")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupBy("users.id")
                ->select(["users.*"]);
        }

        return $resources;
    }


}
