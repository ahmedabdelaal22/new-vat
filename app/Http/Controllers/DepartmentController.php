<?php

namespace App\Http\Controllers;

use App\Models\Department;
use Illuminate\Http\Request;
use App\Http\Requests\DepartmentRequest;
use View;
use DB;

class DepartmentController extends CrudController
{
        
    public function __construct(Request $request)
    {

        $this->model = new Department();
        $this->basicViewFolder = 'departments';
        $this->basicRoute = 'departments';
        $this->request = $request;
        $this->validationRequestClass = new DepartmentRequest();
        parent::__construct();
    }

   
}
