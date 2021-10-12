<?php


namespace App\Http\Controllers\Reports;


use App\Http\Controllers\Controller;
use App\Http\Requests\CollectionRequest;
use App\Models\Client;
use App\Models\Collection;
use App\Models\SalesInvoice;
use Illuminate\Http\Request;
use View;

class ClientSalesInvoiceReportController extends ReportController
{


    public function __construct(Request $request)
    {
        $this->model = new SalesInvoice();
        $this->basicViewFolder = 'reports/client_sales_invoice';
        $this->basicRoute = 'reports/client_sales_invoice';

        parent::__construct();
    }


    public function initial_cols($resources)
    {

        $resources_array = [];

        foreach ($resources as $resource) {


            $items = [];
            foreach ($resource->items as $item ){
                array_push($items, optional($item->item)->name);
            }

            array_push($resources_array,
                array(
                    "code" => $resource->code,
                    "client" => optional($resource->client)->name,
                    "inventory" => optional($resource->inventory)->name,
                    "final_total" => $resource->final_total,
                    "paid_amount" => $resource->paid_amount,
                    "remaining_amount" => $resource->remaining_amount,
                    "discount_amount" => $resource->discount_amount,
                    "date" => $resource->date,
                    "lead" => optional($resource->lead)->title,
                    "items" => implode(",", $items),
                )
            );
        }

        return $resources_array;
    }


    public function initial_conditions($resources){

        return $resources->where('sales_invoices.status', '=', 'closed');

    }


  
    public function initial_responsables($resources){
        if (Auth()->user() && !Auth()->user()->is_super_admin) {
            $resources = $resources->leftjoin('responsables as res', 'sales_invoices.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\SalesInvoice")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupby("sales_invoices.id")
                ->select(["sales_invoices.*"]);
        }

        return $resources;
    }



}
