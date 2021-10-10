<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\InventoryItem;

class InventoryItemController extends CrudController
{
    public function __construct(Request $request)
    {

        $this->model = new InventoryItem();
        $this->basicViewFolder = 'inventory_items';
        $this->basicRoute = 'inventory_items';
        $this->request = $request;
        
        // $this->rulesMessages = $validationRequest->messages();
        
        parent::__construct();
    }



       public function initial_responsables($resources){

        if (Auth()->user() && !Auth()->user()->is_super_admin) { 

            
            $resources= $resources ->leftjoin("inventories","inventories.id","=","inventory_items.inventory_id");
            
			$resources = $resources->leftjoin('responsables as res', 'inventories.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\Inventory")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupby('inventory_items.id')
                ->select(["inventory_items.*"]);
 
 

        } 

        return $resources;
    }
}
