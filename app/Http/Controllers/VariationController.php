<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Variation;
use App\Http\Requests\VariationRequest;

class VariationController extends CrudController
{
    public function __construct(Request $request)
    {

        $this->model = new Variation();
        $this->basicViewFolder = 'variations';
        $this->basicRoute = 'variations';
        $this->request = $request;
        
        $this->validationRequestClass = new VariationRequest();

        
        parent::__construct();
    }

}
