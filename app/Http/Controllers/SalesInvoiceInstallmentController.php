<?php

namespace App\Http\Controllers;
use App\Models\SalesInvoiceInstallment;
use Illuminate\Http\Request;

class SalesInvoiceInstallmentController extends CrudController
{
    public function __construct(Request $request)
    {

        $this->model = new SalesInvoiceInstallment();
        $this->basicViewFolder = 'sales_invoices_installments';
        $this->basicRoute = 'sales_invoices_installments';
        $this->request = $request;
        
        parent::__construct();
        
    }

    public function index(Request $request){
    	$this->model = $this->model->where('sales_invoice_installments.status','closed');
    	return parent::index($request);
    }



     public function initial_responsables($resources){
        if (Auth()->user() && !Auth()->user()->is_super_admin) {


            $resources = $resources
                ->leftjoin('sales_invoices', 'sales_invoices.id', '=', 'sales_invoice_installments.invoice_id')
                ->leftjoin('responsables as res', 'sales_invoices.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\SalesInvoice")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupby("sales_invoice_installments.id")
                ->select(["sales_invoice_installments.*"]);
        }

        return $resources;
    }
}
