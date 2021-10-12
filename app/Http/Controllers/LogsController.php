<?php

namespace App\Http\Controllers;

use App\Http\Controllers\CrudController;
use App\Http\Requests\LeadRequest;
use App\Models\Lead;
use Illuminate\Http\Request;
use App\Models\Log;
use Auth;
use DB;

class LogsController extends CrudController
{
    public function __construct(Request $request)
    {
        $this->model = new Log();
        $this->basicViewFolder = 'logs';
        $this->basicRoute = 'logs';
        $this->request = $request;
        parent::__construct();
    }

}
