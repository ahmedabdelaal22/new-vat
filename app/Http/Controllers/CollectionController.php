<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\CollectionRequest;
use App\Models\Collection;
use App\Models\CollectionItem;
use App\Models\SalesInvoice;
use App\Models\Client;
use DB;
use Carbon\Carbon;

class CollectionController extends CrudController
{
    
    public function __construct(Request $request)
    {

        $this->model = new Collection();
        $this->basicViewFolder = 'collection';
        $this->basicRoute = 'collection';
        $this->request = $request;
        $this->validationRequestClass = new CollectionRequest();
        
        parent::__construct();
        
    }

    public function store (){

        $this->runValidation();

        
    	try {
    		
    		DB::beginTransaction();

    		$this->request->merge(['created_by'=>auth()->user()->id]);

	        $data = $this->request->all();

	        $data['date'] = Carbon::parse($this->request->date);
	        
	        $data['status'] = 'open';

	        $collection = $this->model::create($data);
			if ($this->request->has('collection_items') && !empty($this->request->collection_items)) {
	        	foreach ($this->request->collection_items as $item) {
	        		CollectionItem::create([
	        			'collection_id'=>$collection->id, 
	        			'model_id'=>$item, 
	        			'model_type'=>'App\Models\SalesInvoice',
	        			'amount' => 0
	        		]);
	        	}
	        }

    		DB::commit();

	        toastr()->success(trans('main.saved_successfully'));

	        return redirect()->route($this->basicRoute.'.index');
    	} catch (Exception $e) {
    		return redirec()->back()->withErrors($e->getMessage());
    	}
    }

    public function update($id){
        
        $this->runValidation();

    	try {
    		
    		DB::beginTransaction();

	        $data = $this->request->all();
	        
	        $data['date'] = Carbon::parse($this->request->date);

	        $collection = $this->model::findOrFail($id);
	        
	        if ($collection->status != 'open') {
	        	throw new Exception(__('main.cannot_edit'), 1);	
	        }

	        $collection->update($data);
        
	        CollectionItem::where('collection_id',$id)->delete();

	        if ($this->request->has('collection_items') && !empty($this->request->collection_items)) {
	        	foreach ($this->request->collection_items as $item) {
	        		CollectionItem::create([
	        			'collection_id'=>$collection->id, 
	        			'model_id'=>$item, 
	        			'model_type'=>'App\Models\SalesInvoice',
	        			'amount' => 0
	        		]);
	        	}
	        }


    		DB::commit();

	        toastr()->success(trans('main.saved_successfully'));

	        return redirect()->route($this->basicRoute.'.index');

    	} catch (Exception $e) {
    		DB::rollback();
    		return redirec()->back()->withErrors($e->getMessage());
    	}
    }


    public function getClientSalseInvoices(Request $request){

    	$salseInvoices = SalesInvoice::where('client_id',$request->client_id)->where('remaining_amount','>',0)->where('status','closed')


                ->leftjoin('responsables as res', 'sales_invoices.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\SalesInvoice")
                ->where(function ($q) {
                 
                    if( !Auth()->user()->is_super_admin){
                           $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);
 
                            $q->where("res.employee_id", Auth()->user()->id);
                            $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                    }


                })
                ->groupby("sales_invoices.id") ->select(["sales_invoices.*"])



        ->get();
    	return responseJson(1,'success',$salseInvoices);
    }

    public function approve($id){
    	// return $id;
    	try {
    		
    		$collection = $this->model::where('id',$id)->first();

    		if (!$collection) {
    			throw new Exception(trans('main.not_found_record'), 1);
    		}
    		
    		if ($collection->status !='open') {
    			throw new Exception(__('main.approved_before'), 1);
    		}

    		DB::beginTransaction();

    		$client = Client::where('id',$collection->client_id)->first();

    		if (!$client) {
    			throw new Exception(trans('main.cannot_find_clent'), 1);
    		}

    		$paidAmount = $collection->amount;
    		
    		CollectionItem::where('model_type','App\Models\Collection')->delete();

    		$collectionItems = CollectionItem::where('collection_id',$collection->id)->get();

    		foreach ($collectionItems as $collectionItem) {
    			// return $paymentItem;
    			// new App\Models\SalesInvoice()
    			$collectionItemModel = new $collectionItem->model_type();
    			
    			$collectionItemModel = $collectionItemModel->where('id',$collectionItem->model_id)->first();
    			
    			$itemAmount = 0;

    			if ($paidAmount > $collectionItemModel->remaining_amount) {
					$itemAmount = $collectionItemModel->remaining_amount;
    			}else{
    				$itemAmount = $paidAmount;
    			}

    			$collectionItemModel->decrement('remaining_amount',round($itemAmount,4));
    			
    			$collectionItemModel->increment('paid_amount',round($itemAmount,4));

    			$collectionItem->update(['amount'=>$itemAmount]);
    			
    			$paidAmount -= $itemAmount;

    			// return $paymentItemModel;
    		}

    		if ($paidAmount > 0) {

    			foreach (SalesInvoice::where('client_id',$collection->client_id)->where('remaining_amount','>','0')->where('status','closed')->get() as $salesInvoice) {
    				
    				$itemAmount = 0;

	    			if ($paidAmount > $salesInvoice->remaining_amount) {
						$itemAmount = $salesInvoice->remaining_amount;
	    			}else{
	    				$itemAmount = $paidAmount;
	    			}

	    			$salesInvoice->decrement('remaining_amount',round($itemAmount,4));
	    			
	    			$salesInvoice->increment('paid_amount',round($itemAmount,4));

	    			CollectionItem::create([
	    				'collection_id'=>$collection->id, 
	    				'model_id'=>$salesInvoice->id, 
	    				'model_type'=>'App\Models\SalesInvoice', 
	    				'amount'=>$itemAmount
	    			]);

	    			$paidAmount -= $paidAmount;

    			}

    		}

    		if ($paidAmount > 0) {

    			CollectionItem::create([
    				'collection_id'=>$collection->id, 
    				'model_id'=>$collection->id, 
    				'model_type'=>'App\Models\Collection', 
    				'amount'=>$paidAmount
    			]);
    		}

    		$client->decrement('balance',$collection->amount);

    		// return $paidAmount;

    		$collection->update([
    			'status'=>'closed',
    			'confirmed_by'=>Auth()->user()->id,
    			'confirmed_at'=>Carbon::now()
    		]);

    		DB::commit();

    		if (request()->ajax()) {
	            return responseJson(1,trans('main.approved_successfully'),['id'=>$id]);

	        }else{
	            toastr()->success(trans('main.approved_successfully'));
	            return redirect()->route($this->basicRoute.'.index');
	        }


    	} catch (Exception $e) {

    		DB::rollback();

    		if (request()->ajax()) {
	            return responseJson(0,$e->getMessage());

	        }else{
	            toastr()->error($e->getMessage());
	            return redirect()->route($this->basicRoute.'.index');
	        }
    	}
    }



    public function print($id){
    	$resource = $this->model::findOrFail($id);
    	return view($this->basicViewFolder.'.print',compact('resource'));
	}
	
    public function destroy($id){
    	try {
    		
    		$collection = $this->model::findorFail($id);

	    	if ($collection->status != 'open') {
	    		throw new Exception(trans('main.cannot_delete'), 1);
	    	}
	    	
	    	DB::beginTransaction();

	        CollectionItem::where('collection_id',$id)->delete();
	        
	        $collection->delete();

	        DB::commit();
	        
	        if (request()->ajax()) {
	            return responseJson(1,trans('main.deleted_successfully'),['id'=>$id]);

	        }else{
	            toastr()->success(trans('main.deleted_successfully'));
	            return redirect()->route($this->basicRoute.'.index');
	        }

    	} catch (Exception $e) {
    		
    		DB::rollback();

    		if (request()->ajax()) {
	            return responseJson(0,$e->getMessage());

	        }else{
	            toastr()->error($e->getMessage());
	            return redirect()->route($this->basicRoute.'.index');
	        }
    	}
    }



    public function initial_responsables($resources){
        if (Auth()->user() && !Auth()->user()->is_super_admin) {  
            $resources = $resources
                ->leftjoin('clients', 'clients.id', '=', 'collections.client_id')
                ->leftjoin('responsables as res', 'clients.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\Client")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupby("collections.id")
                ->select(["collections.*"]);
        }

        return $resources;
    }

}
