<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PurchaseInstallment;

class PurchaseInstallmentController extends CrudController
{
    
    public function __construct(Request $request)
    {

        $this->model = new PurchaseInstallment();
        $this->basicViewFolder = 'purchase_installments';
        $this->basicRoute = 'purchase_installments';
        $this->request = $request;
        
        // $this->rulesMessages = $validationRequest->messages();

        
        parent::__construct();
        
    }

    public function index(Request $request){
    	$this->model = $this->model->where('purchase_installments.status','closed'); 
    	return parent::index($request);
    }


     public function initial_responsables($resources){
        if (Auth()->user() && !Auth()->user()->is_super_admin) {


            $resources = $resources
                ->leftjoin('purchase_invoices', 'purchase_invoices.id', '=', 'purchase_installments.invoice_id')
                ->leftjoin('responsables as res', 'purchase_invoices.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\PurchaseInvoice")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupby("purchase_installments.id")
                ->select(["purchase_installments.*"]);
        }

        return $resources;
    }

}
