<?php

namespace App\Http\Controllers;

use App\Models\Responsable;
use Illuminate\Http\Request;
use App\Models\PurchaseInvoice;
use App\Models\PurchaseInvoiceItem;
use App\Models\InventoryItem;
use App\Models\Supplier;
use App\Models\PurchaseInstallment;
use App\Http\Requests\PurchaseInvoiceRequest;
use DB;
use Exception;
use Carbon\Carbon;

class PurchaseInvoiceController extends CrudController
{
    public function __construct(Request $request)
    {

        $this->model = new PurchaseInvoice();
        $this->basicViewFolder = 'purchase_invoices';
        $this->basicRoute = 'purchase_invoices';
        $this->request = $request;

        $this->validationRequestClass = new PurchaseInvoiceRequest();

        parent::__construct();

    }

    public function store()
    {

    	$this->runValidation();

    	$data = $this->request->all();

    	$invoiceData = [
    		'date'=>Carbon::parse($this->request->date),
    		'supplier_id'=>$this->request->supplier_id,
    		'code'=>$this->request->code,
    		'purchase_invoice_number'=>$this->request->purchase_invoice_number,
    		'inventory_id'=>$this->request->inventory_id,
    		'total'=>$this->request->total,
    		'final_total'=>$this->request->final_total,
    		'total_after_discount'=>$this->request->total_after_discount,
    		'discount'=>0,
    		'payment_type'=>$this->request->payment_type,
    		'discount_type'=>$this->request->discount_type,
    		'discount_amount'=>$this->request->discount_amount,
    		'total_taxes_amount'=>0,
    		'paid_amount'=>$this->request->paid_amount,
    		'remaining_amount'=>$this->request->remaining_amount,
    		'status'=>'new',
    		'notes'=>$this->request->notes,
    		'created_by'=>Auth()->user()->id
    	];

    	try {

    		$total = 0 ;

	    	DB::beginTransaction();

	        $resource = $this->model::create($invoiceData);

            // save responsables
            Responsable::where('model_type', 'App\Models\PurchaseInvoice')->where("model_id", $resource->id)->delete();
            if (!empty($this->request->responsables)) {
                foreach ($this->request->responsables as $responsable) {

                    Responsable::create([
                        'employee_id' => $responsable,
                        'model_id' => $resource->id,
                        'model_type' => 'App\Models\PurchaseInvoice'
                    ]);

                }
            }


	        if ($this->request->has('invoice_items') && !empty($this->request->invoice_items)) {

	        	$counter = 0;

	        	foreach ($this->request->invoice_items['item_id'] as $item_id) {

	        		if (!empty($item_id)) {

						$total +=  ((isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0) * ((isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0 );

	        			$invoiceItemData = [
	        				'item_id'=>$this->request->invoice_items['item_id'][$counter],
	        				'inventory_id'=>$this->request->inventory_id,
	        				'invoice_id'=>$resource->id,
	        				'amount'=>(isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0,
	        				'price'=>(isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0,
	        				'unit_price'=>(isset($this->request->invoice_items['unit_price'][$counter]) && !empty($this->request->invoice_items['unit_price'][$counter])) ? $this->request->invoice_items['unit_price'][$counter] : 0,
	        				'sale_price'=>(isset($this->request->invoice_items['sale_price'][$counter]) && !empty($this->request->invoice_items['sale_price'][$counter])) ? $this->request->invoice_items['sale_price'][$counter] : 0,
	        				'purchase_price'=>(isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0,
	        				'notes'=>(isset($this->request->invoice_items['notes'][$counter]) && !empty($this->request->invoice_items['notes'][$counter])) ? $this->request->invoice_items['notes'][$counter] : 0
	        			];

	        			PurchaseInvoiceItem::create($invoiceItemData);
	        		}

	        		$counter++;
	        	}
	        }

	        $discount = 0;

	        if ($this->request->discount_type == 'percent') {

	        	$discount = ($this->request->discount_amount * $total)/100;

	        }else{

	        	$discount = $this->request->discount_amount;

	        }

	        $totalAfterDiscount = $total - $discount;

	        $finalTotal = $totalAfterDiscount;

	        $remainingAmount = $finalTotal - $this->request->paid_amount ;


	        if ($remainingAmount > 0 && !empty($this->request->invoice_installments)) {
	        	$installmentCounter = 0;
	        	foreach ($this->request->invoice_installments['amount'] as $amount) {
		    		if ($amount > 0) {

		    			$installmentData = [
		    				'supplier_id'=>$resource->supplier_id,
		    				'invoice_id'=>$resource->id,
		    				'amount'=>$amount,
		    				'date'=>Carbon::parse($this->request->invoice_installments['date'][$installmentCounter]),
		    				'notes'=>$this->request->invoice_installments['notes'][$installmentCounter],
		    				'status'=>'open'
		    			];

		    			PurchaseInstallment::create($installmentData);

		    		}

		    		$installmentCounter++;
		    	}
	        }

	    	$resource->update([
	    		'total'=>$total,
	    		'discount'=>$discount,
	    		'total_after_discount'=>$totalAfterDiscount,
	    		'remaining_amount'=>$remainingAmount


	    	]);

	        DB::commit();

	        toastr()->success(trans('main.saved_successfully'));

	        return redirect()->route($this->basicRoute.'.index');
    	} catch (Exception $e) {
    		DB::rollback();
    		return redirect()->back()->withErrors($e->getMessage());
    	}

    }

    public function update($id)
    {
    	$this->runValidation();

    	$data = $this->request->all();
    	// return $data;

    	$invoiceData = [

    		'date'=>Carbon::parse($this->request->date),
    		'supplier_id'=>$this->request->supplier_id,
    		'code'=>$this->request->code,
    		'purchase_invoice_number'=>$this->request->purchase_invoice_number,
    		'inventory_id'=>$this->request->inventory_id,
    		'total'=>$this->request->total,
    		'final_total'=>$this->request->final_total,
    		'total_after_discount'=>$this->request->total_after_discount,
    		'discount'=>0,
    		'payment_type'=>$this->request->payment_type,
    		'discount_type'=>$this->request->discount_type,
    		'discount_amount'=>$this->request->discount_amount,
    		'total_taxes_amount'=>0,
    		'paid_amount'=>$this->request->paid_amount,
    		'remaining_amount'=>$this->request->remaining_amount,
    		'status'=>'new',
    		'notes'=>$this->request->notes,
    		'created_by'=>Auth()->user()->id
    	];

    	try {

    		$total = 0 ;

	    	DB::beginTransaction();

	        $resource = $this->model::where('id',$id)->first();


            // save responsables
            Responsable::where('model_type', 'App\Models\PurchaseInvoice')->where("model_id", $resource->id)->delete();
            if (!empty($this->request->responsables)) {
                foreach ($this->request->responsables as $responsable) {

                    Responsable::create([
                        'employee_id' => $responsable,
                        'model_id' => $resource->id,
                        'model_type' => 'App\Models\PurchaseInvoice'
                    ]);

                }
            }


            if ($resource->status != 'new') {
	        	throw new Exception(__('main.cannot_edit'), 1);

	        }

	        $resource->update($invoiceData);

	        PurchaseInvoiceItem::where('invoice_id',$resource->id)->delete();

	        if ($this->request->has('invoice_items') && !empty($this->request->invoice_items)) {

	        	$counter = 0;

	        	foreach ($this->request->invoice_items['item_id'] as $item_id) {

	        		if (!empty($item_id)) {

						$total +=  ((isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0) * ((isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0) ;

	        			$invoiceItemData = [
	        				'item_id'=>$this->request->invoice_items['item_id'][$counter],
	        				'inventory_id'=>$this->request->inventory_id,
	        				'invoice_id'=>$resource->id,
	        				'amount'=>(isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0,
	        				'price'=>(isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0,
	        				'unit_price'=>(isset($this->request->invoice_items['unit_price'][$counter]) && !empty($this->request->invoice_items['unit_price'][$counter])) ? $this->request->invoice_items['unit_price'][$counter] : 0,
	        				'sale_price'=>(isset($this->request->invoice_items['sale_price'][$counter]) && !empty($this->request->invoice_items['sale_price'][$counter])) ? $this->request->invoice_items['sale_price'][$counter] : 0,
	        				'purchase_price'=>(isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0,
	        				'notes'=>(isset($this->request->invoice_items['notes'][$counter]) && !empty($this->request->invoice_items['notes'][$counter])) ? $this->request->invoice_items['notes'][$counter] : 0
	        			];

	        			PurchaseInvoiceItem::create($invoiceItemData);
	        		}

	        		$counter++;
	        	}
	        }

	        $discount = 0;

	        if ($this->request->discount_type == 'percent') {

	        	$discount = ($this->request->discount_amount * $total)/100;

	        }else{

	        	$discount = $this->request->discount_amount;

	        }

	        // return $total;

	        $totalAfterDiscount = $total - $discount;

	        $finalTotal = $totalAfterDiscount;

	        $remainingAmount = $finalTotal - $this->request->paid_amount ;

	        // return $remainingAmount;

	        PurchaseInstallment::where('invoice_id',$resource->id)->delete();

	        if ($remainingAmount > 0 && !empty($this->request->invoice_installments)) {
	        	$installmentCounter = 0;
	        	foreach ($this->request->invoice_installments['amount'] as $amount) {
		    		if ($amount > 0) {

		    			$installmentData = [
		    				'supplier_id'=>$resource->supplier_id,
		    				'invoice_id'=>$resource->id,
		    				'amount'=>$amount,
		    				'date'=>Carbon::parse($this->request->invoice_installments['date'][$installmentCounter]),
		    				'notes'=>$this->request->invoice_installments['notes'][$installmentCounter],
		    				'status'=>'open'
		    			];

		    			PurchaseInstallment::create($installmentData);

		    		}

		    		$installmentCounter++;
		    	}
	        }

	    	$resource->update([
	    		'total'=>$total,
	    		'discount'=>$discount,
	    		'total_after_discount'=>$totalAfterDiscount,
	    		'remaining_amount'=>$remainingAmount


	    	]);


	        DB::commit();


	        toastr()->success(trans('main.saved_successfully'));

	        return redirect()->route($this->basicRoute.'.index');
    	} catch (Exception $e) {
    		DB::rollback();
    		return redirect()->back()->withErrors($e->getMessage());
    	}

    }

    public function destroy($id){

    	try {

    		$purchaseInvoice = $this->model::findorFail($id);

	    	if ($purchaseInvoice->status != 'new') {
	    		throw new Exception(trans('main.cannot_delete'), 1);
	    	}

	    	DB::beginTransaction();

	        PurchaseInvoiceItem::where('invoice_id',$id)->delete();
			Responsable::where('model_type', 'App\Models\PurchaseInvoice')->where("model_id", $id)->delete();

	        $purchaseInvoice->delete();

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

    	// return parent::destroy($id);
    }

    public function approve($id){

    	try {

    		DB::beginTransaction();

    		$invoice = $this->model::where('id',$id)->first();

	    	if (!$invoice) {
	    		throw new Exception(trans('main.not_found_invoice'), 1);
	    	}
	    	if ($invoice->status != 'new') {
	    		throw new Exception(__('main.approved_before'), 1);
	    	}
	    	$invoiceItems = PurchaseInvoiceItem::where('invoice_id',$invoice->id)->get();

	    	foreach ($invoiceItems as $invoiceItem) {

	    		$inventoryItem = InventoryItem::where('inventory_id',$invoice->inventory_id)->where('item_id',$invoiceItem->item_id)->first();

	    		if ($inventoryItem) {
	    			$inventoryItem->increment('amount',$invoiceItem->amount);
	    		}else{

	    			$inventoryItemData = [
	        			'inventory_id'=>$invoice->inventory_id,
	        			'item_id'=>$invoiceItem->item_id,
	        			'amount'=>$invoiceItem->amount,
	        			'unit_price'=>$invoiceItem->unit_price,
	        			'purchase_price'=>$invoiceItem->purchase_price,
	        			'sale_price'=>$invoiceItem->sale_price
		    		];

		    		InventoryItem::create($inventoryItemData);
	    		}

	    	}

	    	$supplier = Supplier::where('id',$invoice->supplier_id)->first();

	    	if (!$supplier) {

	    		throw new Exception(trans('main.supplier_not_found'), 1);

	    	}

	    	if ($invoice->remaining_amount > 0) {
	    		$supplier->increment('balance',$invoice->remaining_amount);
	    	}

	    	PurchaseInstallment::where('invoice_id',$invoice->id)
	    	->update(['status'=>'closed']);

	    	$invoice->update([
	    		'status'=>'closed',
	    		'confirmed_by'=>Auth()->user()->id,
	    		'confirmed_at'=>Carbon::now()
	    	]);

	    	DB::commit();

	        toastr()->success(trans('main.saved_successfully'));

	        return redirect()->back();

    	} catch (Exception $e) {
    		DB::rollback();
    		return redirect()->back()->withErrors($e->getMessage());
    	}

    }

    public function print($id){
    	$resource = $this->model::where('id',$id)->first();
    	return view($this->basicViewFolder.'.print',compact('resource'));
    }

    public function initial_responsables($resources){
        if (Auth()->user() && !Auth()->user()->is_super_admin) {
            $resources = $resources->leftjoin('responsables as res', 'purchase_invoices.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\PurchaseInvoice")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupby("purchase_invoices.id")
                ->select(["purchase_invoices.*"]);
        }

	        return $resources;
    }

}
