<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Role;
use App\Http\Requests\RoleRequest;

class RoleController extends CrudController
{
    public function __construct(Request $request)
    {
        $request->merge(['guard_name'=>'web']);
        $this->model = new Role();
        $this->basicViewFolder = 'roles';
        $this->basicRoute = 'roles';
        $this->request = $request;

        $this->validationRequestClass = new RoleRequest();
        
        parent::__construct();
    }


    public function store(){

        $this->request->merge(['name'=>$this->request->name_en]);

        return parent::store();
    }
}
