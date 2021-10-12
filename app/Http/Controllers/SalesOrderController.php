<?php

namespace App\Http\Controllers;

use App\Models\Responsable;
use Illuminate\Http\Request;
use App\Models\SalesOrder;
use App\Models\SalesOrderItem;
use App\Models\InventoryItem;

use App\Http\Requests\SalesOrderRequest;
use DB;
use Carbon\Carbon;

class SalesOrderController extends CrudController
{
    public function __construct(Request $request)
    {


        $this->model = new SalesOrder();
        $this->basicViewFolder = 'sales_order';
        $this->basicRoute = 'sales_order';
        $this->request = $request;

        $this->validationRequestClass = new SalesOrderRequest();

        parent::__construct();

    }


    public function store()
    {

        $this->runValidation();

        $data = $this->request->all();

        $invoiceData = [
            'date' => Carbon::parse($this->request->date),
            'client_id' => $this->request->client_id,
            'code' => $this->request->code,
            'inventory_id' => $this->request->inventory_id,
            'total' => $this->request->total,
            'final_total' => $this->request->final_total,
            'total_after_discount' => $this->request->total_after_discount,
            'discount' => 0,
            'discount_type' => $this->request->discount_type,
            'discount_amount' => $this->request->discount_amount,
            'total_taxes_amount' => 0,
            'status' => 'new',
            'notes' => $this->request->notes,
            'lead_id' => $this->request->lead_id,
            'created_by' => Auth()->user()->id
        ];

        try {

            $total = 0;

            DB::beginTransaction();

            $resource = $this->model::create($invoiceData);


            // save responsables
            Responsable::where('model_type', 'App\Models\SalesOrder')->where("model_id", $resource->id)->delete();
            if (!empty($this->request->responsables)) {
                foreach ($this->request->responsables as $responsable) {

                    Responsable::create([
                        'employee_id' => $responsable,
                        'model_id' => $resource->id,
                        'model_type' => 'App\Models\SalesOrder'
                    ]);

                }
            }


            //   return $resource;
            if ($this->request->has('invoice_items') && !empty($this->request->invoice_items)) {

                $counter = 0;

                foreach ($this->request->invoice_items['item_id'] as $item_id) {

                    if (!empty($item_id)) {

                        $total += ((isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0) * ((isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0);

                        $invoiceItemData = [
                            'item_id' => $this->request->invoice_items['item_id'][$counter],
                            'inventory_id' => $this->request->inventory_id,
                            'invoice_id' => $resource->id,
                            'amount' => (isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0,
                            'price' => (isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0,
                            'unit_price' => (isset($this->request->invoice_items['unit_price'][$counter]) && !empty($this->request->invoice_items['unit_price'][$counter])) ? $this->request->invoice_items['unit_price'][$counter] : 0,
                            'sale_price' => (isset($this->request->invoice_items['sale_price'][$counter]) && !empty($this->request->invoice_items['sale_price'][$counter])) ? $this->request->invoice_items['sale_price'][$counter] : 0,
                            'purchase_price' => (isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0,
                            'notes' => (isset($this->request->invoice_items['notes'][$counter]) && !empty($this->request->invoice_items['notes'][$counter])) ? $this->request->invoice_items['notes'][$counter] : 0
                        ];

                        SalesOrderItem::create($invoiceItemData);
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

            $remainingAmount = $finalTotal - $this->request->paid_amount;


            $resource->update([
                'total' => $total,
                'discount' => $discount,
                'total_after_discount' => $totalAfterDiscount,
                // 'remaining_amount'=>$remainingAmount


            ]);

            DB::commit();

            toastr()->success(trans('main.saved_successfully'));

            return redirect()->route($this->basicRoute . '.index');
        } catch (Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());
        }

    }

    public function update($id)
    {
        $this->runValidation();

        $data = $this->request->all();

        $invoiceData = [

            'date' => Carbon::parse($this->request->date),
            'supplier_id' => $this->request->supplier_id,
            'code' => $this->request->code,
            'purchase_invoice_number' => $this->request->purchase_invoice_number,
            'inventory_id' => $this->request->inventory_id,
            'total' => $this->request->total,
            'final_total' => $this->request->final_total,
            'total_after_discount' => $this->request->total_after_discount,
            'discount' => 0,
            'discount_type' => $this->request->discount_type,
            'discount_amount' => $this->request->discount_amount,
            'total_taxes_amount' => 0,
            'status' => 'new',
            'notes' => $this->request->notes,
            'lead_id' => $this->request->lead_id,
            'created_by' => Auth()->user()->id
        ];

        try {

            $total = 0;

            DB::beginTransaction();

            $resource = $this->model::where('id', $id)->first();

            $resource->update($invoiceData);

            // save responsables
            Responsable::where('model_type', 'App\Models\SalesOrder')->where("model_id", $resource->id)->delete();
            if (!empty($this->request->responsables)) {
                foreach ($this->request->responsables as $responsable) {

                    Responsable::create([
                        'employee_id' => $responsable,
                        'model_id' => $resource->id,
                        'model_type' => 'App\Models\SalesOrder'
                    ]);

                }
            }


            SalesOrderItem::where('invoice_id', $resource->id)->delete();

            if ($this->request->has('invoice_items') && !empty($this->request->invoice_items)) {

                $counter = 0;

                foreach ($this->request->invoice_items['item_id'] as $item_id) {

                    if (!empty($item_id)) {

                        $total += ((isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0) * ((isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0);

                        $invoiceItemData = [
                            'item_id' => $this->request->invoice_items['item_id'][$counter],
                            'inventory_id' => $this->request->inventory_id,
                            'invoice_id' => $resource->id,
                            'amount' => (isset($this->request->invoice_items['amount'][$counter]) && !empty($this->request->invoice_items['amount'][$counter])) ? $this->request->invoice_items['amount'][$counter] : 0,
                            'price' => (isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0,
                            'unit_price' => (isset($this->request->invoice_items['unit_price'][$counter]) && !empty($this->request->invoice_items['unit_price'][$counter])) ? $this->request->invoice_items['unit_price'][$counter] : 0,
                            'sale_price' => (isset($this->request->invoice_items['sale_price'][$counter]) && !empty($this->request->invoice_items['sale_price'][$counter])) ? $this->request->invoice_items['sale_price'][$counter] : 0,
                            'purchase_price' => (isset($this->request->invoice_items['purchase_price'][$counter]) && !empty($this->request->invoice_items['purchase_price'][$counter])) ? $this->request->invoice_items['purchase_price'][$counter] : 0,
                            'notes' => (isset($this->request->invoice_items['notes'][$counter]) && !empty($this->request->invoice_items['notes'][$counter])) ? $this->request->invoice_items['notes'][$counter] : 0
                        ];

                        SalesOrderItem::create($invoiceItemData);
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

            $remainingAmount = $finalTotal - $this->request->paid_amount;

            // return $remainingAmount;

            $resource->update([
                'total' => $total,
                'discount' => $discount,
                'total_after_discount' => $totalAfterDiscount,
                // 'remaining_amount'=>$remainingAmount
            ]);

            DB::commit();


            toastr()->success(trans('main.saved_successfully'));

            return redirect()->route($this->basicRoute . '.index');
        } catch (Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());
        }

    }

    public function ajax_json_item($inventory_id)
    {

        $response = InventoryItem::with('formitem')->whereHas('item')->whereHas('inventory')->where('inventory_id', $inventory_id)->get();

        return response()->json($response);
    }

    public function destroy($id)
    {
        SalesOrderItem::where('invoice_id', $id)->delete();
        Responsable::where('model_type', 'App\Models\SalesOrder')->where("model_id", $id)->delete();

        return parent::destroy($id);
    }

    public function confirem($id)
    {
        $resource = $this->model::where('id', $id)->first();
        $invoiceData['confirmed_by'] = Auth()->user()->id;
        $invoiceData['confirmed_at'] = Carbon::now();
        $resource->update($invoiceData);


        return responseJson(1, trans('main.saved_successfully'), ['id' => $resource->id, 'confirmed_at' => $resource->confirmed_at->format('yy-m-d H:i:s')]);

    }

    public function print($id)
    {
        $resource = $this->model::where('id', $id)->first();
        return view($this->basicViewFolder . '.print', compact('resource'));
    }

    public function lead_sales_orders(Request $request,$lead_id){
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
        if ($lead_id && !empty($lead_id) && $lead_id != 'undefined') {

            $resources->where("lead_id","=",$lead_id);
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
