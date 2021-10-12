<?php

namespace App\Http\Controllers;

use App\Http\Requests\SaleInvoiceRequest;
use App\Models\Client;
use App\Models\Responsable;
use App\Models\SalesInvoice;
use App\Models\SalesInvoiceInstallment;
use App\Models\SalesInvoiceItem;
use App\Models\Tax;
use App\Models\SalesOrder;
use Illuminate\Http\Request;
use App\Models\PurchaseInvoice;
use App\Models\PurchaseInvoiceItem;
use App\Models\EInvoicingSDK;
use App\Models\InventoryItem;
use App\Models\SalesInvoiceTaxes;
use App\Models\PurchaseInstallment;
use App\Http\Requests\PurchaseInvoiceRequest;
use Illuminate\Support\Facades\DB;
use Exception;
use Carbon\Carbon;
use Symfony\Component\HttpFoundation\Session\Session;



class SaleInvoiceController extends CrudController
{
    public function __construct(Request $request)
    {
        $session = new Session();
        session()->put('generatedAccessToken', $session->get('generatedAccessToken'));

            session()->save();
        // echo $session->get('generatedAccessToken');

        $this->model = new SalesInvoice;
        $this->basicViewFolder = 'sales_invoices';
        $this->basicRoute = 'sales_invoices';
        $this->request = $request;

        $this->validationRequestClass = new SaleInvoiceRequest();

        parent::__construct();

    }

    public function create(){
        // $session = new Session();
        // echo $session->get('generatedAccessToken');
            // session(['generatedAccessToken'=>$data->access_token]);
           // print_r(Session::all());
          
       
     //          die;
        //session()->forget('generatedAccessToken');
      //echo session('SKDToken');


        $resource = new $this->model();


        if ($this->request->has('sales_order_id') && !empty($this->request->sales_order_id)) {
            $resource = SalesOrder::findOrFail($this->request->sales_order_id);

        }

        if (view()->exists($this->basicViewFolder . '.create')) {
            if (request()->ajax()) {
                return view($this->basicViewFolder . '.create', compact('resource'))->render();
            } else {
                return view($this->basicViewFolder . '.create', compact('resource'));
            }
        }

        return " the view " . $this->basicViewFolder . ".create not found";
    }

    public function store()
    {

        $this->runValidation();

        $data = $this->request->all();

        $invoiceData = [
            'date' => Carbon::parse($this->request->date), // TODO: error in data entry
            'client_id' => $this->request->client_id,
            'code' => $this->request->code,
            'inventory_id' => $this->request->inventory_id,
            'total' => $this->request->total,
            'final_total' => $this->request->final_total,
            'total_after_discount' => $this->request->total_after_discount,
            'discount' => 0,
            'payment_type' => $this->request->payment_type,
            'discount_type' => $this->request->discount_type,
            'discount_amount' => $this->request->discount_amount,
            'total_taxes_amount' => 0,
            'paid_amount' => $this->request->paid_amount,
            'remaining_amount' => $this->request->remaining_amount,
            'currency_id'=>$this->request->currency_id,
            'status' => 'new',
            'notes' => $this->request->notes,
            'lead_id'=>$this->request->lead_id,
            'created_by' => Auth()->user()->id
        ];

        try {

            $total = 0;

            DB::beginTransaction();

            $resource = $this->model::create($invoiceData);

            // save responsables
            Responsable::where('model_type', 'App\Models\SalesInvoice')->where("model_id", $resource->id)->delete();
            if (!empty($this->request->responsables)) {
                foreach ($this->request->responsables as $responsable) {

                    Responsable::create([
                        'employee_id' => $responsable,
                        'model_id' => $resource->id,
                        'model_type' => 'App\Models\SalesInvoice'
                    ]);

                }
            }

            if ($this->request->has('invoice_items') && !empty($this->request->invoice_items)) {

                $counter = 0;

                foreach ($this->request->invoice_items['item_id'] as $item_id) {

                    if (!empty($item_id)) {

                        $total += ((isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0) * ((isset($this->request->invoice_items['sale_price'][$counter]) && !empty($this->request->invoice_items['sale_price'][$counter])) ? $this->request->invoice_items['sale_price'][$counter] : 0);

                        $invoiceItemData = [
                            'item_id' => $this->request->invoice_items['item_id'][$counter],
                            'inventory_id' => $this->request->inventory_id,
                            'invoice_id' => $resource->id,
                            'amount' => (isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0,
                            'price' => (isset($this->request->invoice_items['sale_price'][$counter]) && !empty($this->request->invoice_items['sale_price'][$counter])) ? $this->request->invoice_items['sale_price'][$counter] : 0,
                            'unit_price' => (isset($this->request->invoice_items['unit_price'][$counter]) && !empty($this->request->invoice_items['unit_price'][$counter])) ? $this->request->invoice_items['unit_price'][$counter] : 0,
                            'sale_price' => (isset($this->request->invoice_items['sale_price'][$counter]) && !empty($this->request->invoice_items['sale_price'][$counter])) ? $this->request->invoice_items['sale_price'][$counter] : 0,
                            'purchase_price' => (isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0,
                            'notes' => (isset($this->request->invoice_items['notes'][$counter]) && !empty($this->request->invoice_items['notes'][$counter])) ? $this->request->invoice_items['notes'][$counter] : 0
                        ];

                        SalesInvoiceItem::create($invoiceItemData);
                    }

                    $counter++;
                }
            }

            $discount = 0;

            if ($this->request->discount_type == 'percent') {

                $discount = ($this->request->discount_amount * $total) / 100;

            } else {

                $discount = $this->request->discount_amount;

            }

            $totalAfterDiscount = $total - $discount;

            $finalTotal = $totalAfterDiscount;


            $totalTaxes = 0 ;

            if ($this->request->has('taxes') && !empty($this->request->taxes)) {
                foreach ($this->request->taxes as $taxId) {
                    $taxModel = Tax::where('id',$taxId)->first();

                    if ($taxModel->type == 'percent') {
                        $taxAmount = ($finalTotal * $taxModel->value) /100;
                    }else{
                        $taxAmount = $taxModel->value;
                    }

                    $totalTaxes += $taxAmount;

                    $taxData = [
                        'sales_invoice_id'=>$resource->id,
                        'tax_id'=>$taxId,
                        'amount'=>$taxModel->value,
                        'tax_type'=>$taxModel->type,
                        'tax_name'=>$taxModel->name,
                        'total'=> $taxAmount
                    ];

                    SalesInvoiceTaxes::create($taxData);

                }

            }

            $finalTotal += $totalTaxes;


            $remainingAmount = $finalTotal - $this->request->paid_amount;


            if ($remainingAmount > 0 && !empty($this->request->invoice_installments)) {
                $installmentCounter = 0;
                foreach ($this->request->invoice_installments['amount'] as $amount) {
                    if ($amount > 0) {

                        $installmentData = [
                            'client_id' => $resource->client_id,
                            'invoice_id' => $resource->id,
                            'amount' => $amount,
                            'date' => Carbon::parse($this->request->invoice_installments['date'][$installmentCounter]),
                            'notes' => $this->request->invoice_installments['notes'][$installmentCounter],
                            'status' => 'open'
                        ];

                        SalesInvoiceInstallment::create($installmentData);

                    }

                    $installmentCounter++;
                }
            }

            $resource->update([
                'total' => $total,
                'discount' => $discount,
                'total_after_discount' => $totalAfterDiscount,
                'remaining_amount' => $remainingAmount


            ]);

            DB::commit();

            toastr()->success(trans('main.saved_successfully'));

            return redirect()->route($this->basicRoute . '.index');
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

            'date' => Carbon::parse($this->request->date),
            'client_id' => $this->request->client_id,
            'code' => $this->request->code,
            'inventory_id' => $this->request->inventory_id,
            'total' => $this->request->total,
            'final_total' => $this->request->final_total,
            'total_after_discount' => $this->request->total_after_discount,
            'discount' => 0,
            'payment_type' => $this->request->payment_type,
            'discount_type' => $this->request->discount_type,
            'discount_amount' => $this->request->discount_amount,
            'total_taxes_amount' => 0,
            'paid_amount' => $this->request->paid_amount,
            'currency_id'=>$this->request->currency_id,
            'remaining_amount' => $this->request->remaining_amount,
            'status' => 'new',
            'notes' => $this->request->notes,
            'lead_id'=>$this->request->lead_id,
            'created_by' => Auth()->user()->id
        ];

        try {

            $total = 0;

            DB::beginTransaction();

            $resource = $this->model::where('id', $id)->first();

            // save responsables
            Responsable::where('model_type', 'App\Models\SalesInvoice')->where("model_id", $resource->id)->delete();
            if (!empty($this->request->responsables)) {
                foreach ($this->request->responsables as $responsable) {

                    Responsable::create([
                        'employee_id' => $responsable,
                        'model_id' => $resource->id,
                        'model_type' => 'App\Models\SalesInvoice'
                    ]);

                }
            }
            $resource->update($invoiceData);

            SalesInvoiceItem::where('invoice_id', $resource->id)->delete();

            if ($this->request->has('invoice_items') && !empty($this->request->invoice_items)) {

                $counter = 0;

                foreach ($this->request->invoice_items['item_id'] as $item_id) {

                    if (!empty($item_id)) {

                        $total += ((isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0) * ((isset($this->request->invoice_items['sale_price'][$counter]) && !empty($this->request->invoice_items['sale_price'][$counter])) ? $this->request->invoice_items['sale_price'][$counter] : 0);

                        $invoiceItemData = [
                            'item_id' => $this->request->invoice_items['item_id'][$counter],
                            'inventory_id' => $this->request->inventory_id,
                            'invoice_id' => $resource->id,
                            'amount' => (isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0,
                            'price' => (isset($this->request->invoice_items['sale_price'][$counter]) && !empty($this->request->invoice_items['sale_price'][$counter])) ? $this->request->invoice_items['sale_price'][$counter] : 0,
                            'unit_price' => (isset($this->request->invoice_items['unit_price'][$counter]) && !empty($this->request->invoice_items['unit_price'][$counter])) ? $this->request->invoice_items['unit_price'][$counter] : 0,
                            'sale_price' => (isset($this->request->invoice_items['sale_price'][$counter]) && !empty($this->request->invoice_items['sale_price'][$counter])) ? $this->request->invoice_items['sale_price'][$counter] : 0,
                            'purchase_price' => (isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0,
                            'notes' => (isset($this->request->invoice_items['notes'][$counter]) && !empty($this->request->invoice_items['notes'][$counter])) ? $this->request->invoice_items['notes'][$counter] : 0
                        ];

                        SalesInvoiceItem::create($invoiceItemData);
                    }

                    $counter++;
                }
            }

            $discount = 0;

            if ($this->request->discount_type == 'percent') {

                $discount = ($this->request->discount_amount * $total) / 100;

            } else {

                $discount = $this->request->discount_amount;

            }

            // return $total;

            $totalAfterDiscount = $total - $discount;

            $finalTotal = $totalAfterDiscount;

            SalesInvoiceTaxes::where('sales_invoice_id',$resource->id)->delete();

            $totalTaxes = 0 ;

            if ($this->request->has('taxes') && !empty($this->request->taxes)) {
                foreach ($this->request->taxes as $taxId) {
                    $taxModel = Tax::where('id',$taxId)->first();

                    if ($taxModel->type == 'percent') {
                        $taxAmount = ($finalTotal * $taxModel->value) /100;
                    }else{
                        $taxAmount = $taxModel->value;
                    }

                    $totalTaxes += $taxAmount;

                    $taxData = [
                        'sales_invoice_id'=>$resource->id,
                        'tax_id'=>$taxId,
                        'amount'=>$taxModel->value,
                        'tax_type'=>$taxModel->type,
                        'tax_name'=>$taxModel->name,
                        'total'=> $taxAmount
                    ];

                    SalesInvoiceTaxes::create($taxData);

                }

            }

            $finalTotal += $totalTaxes;

            $remainingAmount = $finalTotal - $this->request->paid_amount;

            // return $remainingAmount;

            SalesInvoiceInstallment::where('invoice_id', $resource->id)->delete();

            if ($remainingAmount > 0 && !empty($this->request->invoice_installments)) {
                $installmentCounter = 0;
                foreach ($this->request->invoice_installments['amount'] as $amount) {
                    if ($amount > 0) {

                        $installmentData = [
                            'client_id' => $resource->client_id,
                            'invoice_id' => $resource->id,
                            'amount' => $amount,
                            'date' => Carbon::parse($this->request->invoice_installments['date'][$installmentCounter]),
                            'notes' => $this->request->invoice_installments['notes'][$installmentCounter],
                            'status' => 'open'
                        ];

                        SalesInvoiceInstallment::create($installmentData);

                    }

                    $installmentCounter++;
                }
            }

            $resource->update([
                'total' => $total,
                'discount' => $discount,
                'total_after_discount' => $totalAfterDiscount,
                'remaining_amount' => $remainingAmount


            ]);


            DB::commit();


            toastr()->success(trans('main.saved_successfully'));

            return redirect()->route($this->basicRoute . '.index');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->withErrors($e->getMessage());
        }

    }

    public function destroy($id)
    {
        SalesInvoiceItem::where('invoice_id', $id)->delete();
        Responsable::where('model_type', 'App\Models\SalesInvoice')->where("model_id", $id)->delete();
        return parent::destroy($id);
    }

    public function approve($id)
    {

        try {

            DB::beginTransaction();

            $invoice = $this->model::where('id', $id)->first();

            if (!$invoice) {
                throw new Exception(trans('main.not_found_invoice'), 1);
            }

            $invoiceItems = SalesInvoiceItem::where('invoice_id', $invoice->id)->get();

            foreach ($invoiceItems as $invoiceItem) {

                $inventoryItem = InventoryItem::where('inventory_id', $invoice->inventory_id)->where('item_id', $invoiceItem->item_id)->first();

                if ($inventoryItem) {

                    if ($invoiceItem->amount > $inventoryItem->amount) {
                        throw new Exception(optional($invoiceItem->item)->name.trans('main.inventory_amount_less_than').$invoiceItem->amount, 1);

                    }

                    $inventoryItem->decrement('amount', $invoiceItem->amount);
                } else {

                    throw new Exception(trans('main.items_not_found'), 1);
                }

            }

            $client = Client::where('id', $invoice->client_id)->first();

            if (!$client) {

                throw new Exception(trans('main.client_not_found'), 1);

            }

            if ($invoice->remaining_amount > 0) { //
                $client->decrement('balance', $invoice->remaining_amount);
            }

            SalesInvoiceInstallment::where('invoice_id', $invoice->id) // Todo: how do you want to close installement status without checking the remaining amount
                ->update(['status' => 'closed']);

            $invoice->update([
                'status' => 'closed',
                'confirmed_by' => Auth()->user()->id,
                'confirmed_at' => Carbon::now()
            ]);

            DB::commit();

            toastr()->success(trans('main.saved_successfully'));

            return redirect()->back();

        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->withErrors($e->getMessage());
        }

    }

    public function print($id)
    {
        $resource = $this->model::where('id', $id)->first();
        return view($this->basicViewFolder . '.print', compact('resource'));
    }

    public function lead_sales_invoices(Request $request,$lead_id){
        // return array_unique($this->model::get()->pluck('type')->toArray());

        $limit = 10;
        $page = 10;
        $sortby = 'id';
        $sorttype = 'Desc';


        if ($request->has('limit') && !empty($request->limit) && $request->limit != 'undefined') {
            $limit = $request->limit;
        }

        if ($request->has('page') && !empty($request->page) && $request->page != 'undefined') {
            $page = $request->page;
        }


        if ($request->has('sortby') && !empty($request->sortby) && $request->sortby != 'undefined') {
            $sortby = $request->sortby;
        }

        if ($request->has('sorttype') && !empty($request->sorttype) && $request->sorttype != 'undefined') {
            $sorttype = $request->sorttype;
        }


        $resources = $this->model;




        if ($request->has('search_query')) {

            $resources = $resources->search();

        }





        if (isset($this->model->table)) {
            $resources = $resources->orderBy($this->model->table . '.' . $sortby, $sorttype);
        } else {
            $resources = $resources->orderBy($sortby, $sorttype);
        }
    

        $resources = $resources->paginate($limit);


        // return $resources;

        $resources->setPath($request->fullUrl());


        if (view()->exists($this->basicViewFolder . '.index')) {
            if ($request->ajax()) {
                return view($this->basicViewFolder . '._table', compact('resources'))->render();
            } else {
                return view($this->basicViewFolder . '.index', compact('resources'));
            }
        }

        return " the view " . $this->basicViewFolder . ".index not found";


    }


    public function sdkinvoice($id){


  
        $inv=new EInvoicingSDK();
        $url='/api/v1/documentsubmissions';

  //      try {

         //   DB::beginTransaction();

            $invoice = $this->model::where('id', $id)->first();

            if (!$invoice) {
                throw new Exception(trans('main.not_found_invoice'), 1);
            }

            $invoiceItems = SalesInvoiceItem::where('invoice_id', $invoice->id)->get();
            
            $params["invoiceLines"]=[];
            $i=0;
            $currency=$invoice->currency;
            foreach ($invoiceItems as $invoiceItem) {

                  $item=$invoiceItem->item;
                 
                if ($item) {
           
        $params["invoiceLines"][$i]['description']=$item->name_en;
        $params["invoiceLines"][$i]['itemType']='EGS';
        $params["invoiceLines"][$i]['itemCode']=$item->itemCode;
        $params["invoiceLines"][$i]['unitType']=$item->unitType;
        $params["invoiceLines"][$i]['quantity']=$invoiceItem->amount;
        $params["invoiceLines"][$i]['internalCode']=(string)$invoiceItem->id;
        $params["invoiceLines"][$i]['unitValue']['currencySold']=($currency)?$currency->code:'EGP';
        $params["invoiceLines"][$i]['unitValue']['amountSold']=$invoiceItem->sale_price;
        $params["invoiceLines"][$i]['unitValue']['currencyExchangeRate']=$rate=($currency)?$currency->amount:1;
        $params["invoiceLines"][$i]['unitValue']['amountEGP']=$amountegp=$rate*$invoiceItem->sale_price;
        $params["invoiceLines"][$i]['salesTotal']=$ST=$invoiceItem->amount*$amountegp;
        $params["invoiceLines"][$i]['valueDifference']=0;
        $params["invoiceLines"][$i]['itemsDiscount']=0;
        $params["invoiceLines"][$i]['totalTaxableFees']=$TTF=500;
        $params["invoiceLines"][$i]['discount']['rate']=$rate=($invoiceItem->discount_type=='fixed')?0:$invoiceItem->discount_amount;
        $params["invoiceLines"][$i]['discount']['amount']=$DA=($invoiceItem->discount_type=='fixed')?
        $ST-$invoiceItem->discount_amount:($ST*$invoiceItem->discount_amount)/100;
        $params["invoiceLines"][$i]['netTotal']=$NT=$ST-$DA;
        $params["invoiceLines"][$i]['total']=$NT+$TTF;
                } else {

                    throw new Exception(trans('main.items_not_found'), 1);
                }
                   $i++;
            }

            $client = Client::where('id', $invoice->client_id)->first();

            if (!$client) {
           throw new Exception(trans('main.client_not_found'), 1);
             }

             $params["internalID"]=$id;
             $params["branchID"]=$invoice->inventory_id;
             $params["totalDiscountAmount"]=0;
             $params["totalSalesAmount"]=$invoice->total;
             $params["netAmount"]=$invoice->total_after_discount;
             $params["totalAmount"]=$invoice->final_total;
             $params["extraDiscountAmount"]=0;
             $params["totalItemsDiscountAmount"]=0;


             $params["taxTotals"]=[];
             $t=0;
     //  return $invoice->taxes;
             foreach($invoice->taxes as $tax){
                $params["taxTotals"][$t]['taxType']=$tax->tax_name;
             
                    $params["taxTotals"][$t]['amount']=$tax->total;
  
       
                   $t++;
             }
        
             
            $params['address_country']=$client->address_country ;
            $params['address_governate']=$client->address_governate;
             $params['address_regionCity']=$client->address_regionCity;
             $params['address_street']=$client->address_street;
             $params['address_buildingNumber']=$client->address_buildingNumber;
             $params['address_postalCode']=$client->address_postalCode;
             $params['address_floor']=$client->address_floor;
            $params['address_room']=$client->address_room;
            $params['address_landmark']=$client->address_landmark;
            $params['address_additionalInformation']=$client->address_additionalInformation;
            $params['receiver_type']=$client->receiver_type;
            $params['receiver_id']=$client->receiver_id;
            $params['receiver_name']=$client->name;
    //     die("test");

      
     // return $invoice;
     $data=$inv->postDoc($url,$params);

    // die($id);
       if($data){
       
         $uuid =  $data->acceptedDocuments[0]->uuid;
         $invoice->uuid= $uuid ;
         $invoice->save();
    
         $this->showinvoice($uuid);

       }
      // die("tests");
         //     die('test');

     
           // DB::commit();

            toastr()->success(trans('main.saved_successfully'));

          //  return redirect()->back();

        // } catch (Exception $e) {
        //     DB::rollback();
        //     return redirect()->back()->withErrors($e->getMessage());
        // }

           
      


    }



    public function showinvoice($uuid)
    {
        //   die($uuid);
     
        $inv=new EInvoicingSDK();
        $url="/api/v1/documents/$uuid/raw";
        $data=$inv->getDoc($url);

        return view($this->basicViewFolder . '.showinvoice', compact('data'));

        //  return " the view " . $this->basicViewFolder . ".showinvoice not found";
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
