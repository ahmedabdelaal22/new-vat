<?php

namespace App\Http\Controllers;

use App\Models\Currency;
use Illuminate\Http\Request;
use App\Http\Requests\CurrencyRequest;
use View;
use DB;

class CurrencyController extends CrudController
{
        
    public function __construct(Request $request)
    {

        $this->model = new Currency();
        $this->basicViewFolder = 'currency';
        $this->basicRoute = 'currency';
        $this->request = $request;
        $this->validationRequestClass = new CurrencyRequest();
        parent::__construct();
    }

   
}
