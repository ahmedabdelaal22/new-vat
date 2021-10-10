<?php


namespace App\Http\Controllers\Reports;


use App\Http\Controllers\Controller;
use App\Http\Requests\CollectionRequest;
use App\Models\Client;
use App\Models\Collection;
use App\Models\SalesOrder;
use Illuminate\Http\Request;
use View;

class ClientSalesOrderReportController extends ReportController
{


    public function __construct(Request $request)
    {
        $this->model = new SalesOrder();
        $this->basicViewFolder = 'reports/client_sales_order';
        $this->basicRoute = 'reports/client_sales_order';

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
                    "client" => optional($resource->client_user)->name,
                    "inventory" => optional($resource->inventory)->name,
                    "final_total" => $resource->final_total,
                    "discount_amount" => $resource->discount_amount,
                    "date" => $resource->date,
                 
                    "items" => implode(",", $items),
                )
            );
        }

        return $resources_array;
    }

    public function initial_conditions($resources){


        return null;
    }

    public function initial_responsables($resources){
        if (Auth()->user() && !Auth()->user()->is_super_admin) {
            $resources = $resources->leftjoin('responsables as res', 'sales_orders.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\SalesOrder")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupby("sales_orders.id")
                ->select(["sales_orders.*"]);
        }

        return $resources;
    }
}
