<?php

namespace App\Http\Controllers;

use App\Models\Tax;
use Illuminate\Http\Request;
use App\Http\Requests\TaxRequest;
use View;
use DB;

class TaxeController extends CrudController
{
        
    public function __construct(Request $request)
    {

        $this->model = new Tax();
        $this->basicViewFolder = 'taxes';
        $this->basicRoute = 'taxes';
        $this->request = $request;
        $this->validationRequestClass = new TaxRequest();
        parent::__construct();
    }

   
}
