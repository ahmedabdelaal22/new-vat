<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ClientCategory;
use App\Http\Requests\ClientCategoryRequest;

class ClientCategoryController extends CrudController
{
    public function __construct(Request $request)
    {

        $this->model = new ClientCategory();
        $this->basicViewFolder = 'client_categories';
        $this->basicRoute = 'client_categories';
        $this->request = $request;
        
        $this->validationRequestClass = new ClientCategoryRequest();

        parent::__construct();
    }

}
