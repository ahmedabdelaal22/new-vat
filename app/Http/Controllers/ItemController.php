<?php

namespace App\Http\Controllers;

use App\Models\Responsable;
use Illuminate\Http\Request;
use App\Models\Item;
use App\Models\ItemTaxe;

use App\Models\ItemVariation;
use App\Models\Variation;
use App\Models\SalesOrderItem;
use App\Models\SalesInvoiceItem;
use App\Models\PurchaseInvoiceItem;
use App\Http\Requests\ItemRequest;
use DB;

class ItemController extends CrudController
{
    public function __construct(Request $request)
    {

        $this->model = new Item();
        $this->basicViewFolder = 'items';
        $this->basicRoute = 'items';
        $this->request = $request;

        $this->validationRequestClass = new ItemRequest();

        parent::__construct();

    }


    public function store()
    {

        $this->runValidation();

        $data = [
            'category_id' => $this->request->category_id,
            'name_ar' => $this->request->name_ar,
            'name_en' => $this->request->name_en,
            'unit_price' => $this->request->unit_price,
            'purchase_price' => $this->request->purchase_price,
            'sale_price' => $this->request->sale_price,
            'unitType' => $this->request->unitType,
            'itemCode' => $this->request->itemCode,
            'notes' => $this->request->notes
        ];

        DB::beginTransaction();

        $item = $this->model::create($data);

        // save responsables
        Responsable::where('model_type', 'App\Models\Item')->where("model_id", $item->id)->delete();
        if (!empty($this->request->responsables)) {
            foreach ($this->request->responsables as $responsable) {

                Responsable::create([
                    'employee_id' => $responsable,
                    'model_id' => $item->id,
                    'model_type' => 'App\Models\Item'
                ]);

            }
        }

        ItemTaxe::where("item_id", $item->id)->delete();
        if (!empty($this->request->item_taxes)) {
            foreach ($this->request->item_taxes as $ix) {

                ItemTaxe::create([
                    'tax_id' => $ix,
                    'item_id' => $item->id
                ]);

            }
        }

        if ($this->request->has('variations') && !empty($this->request->variations)) {

            $counter = 0;

            foreach ($this->request->variations as $variationId => $value) {

                $variation = Variation::where('id', $variationId)->first();

                if ($variation) {

                    $itemVariationData = [
                        'variation_id' => $variation->id,
                        'item_id' => $item->id,
                        'label_ar' => $variation->label_ar,
                        'label_en' => $variation->label_en,
                        'name' => $variation->name,
                        'type' => $variation->type,
                        'options' => $variation->options,
                        'value_ar' => $value,
                        'value_en' => $value
                    ];

                    ItemVariation::create($itemVariationData);

                }
                var_dump($variationId);

                $counter++;
            }
        }

        // return 'ddd';

        DB::commit();

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');
    }

    public function update($id)
    {
        $this->runValidation();

        $data = [
            'category_id' => $this->request->category_id,
            'name_ar' => $this->request->name_ar,
            'name_en' => $this->request->name_en,
            'unit_price' => $this->request->unit_price,
            'purchase_price' => $this->request->purchase_price,
            'sale_price' => $this->request->sale_price,
            'unitType' => $this->request->unitType,
            'itemCode' => $this->request->itemCode,
            'notes' => $this->request->notes
        ];

        DB::beginTransaction();

        $item = $this->model::findOrFail($id);

        $item->update($data);


        // save responsables
        Responsable::where('model_type', 'App\Models\Item')->where("model_id", $item->id)->delete();
        if (!empty($this->request->responsables)) {
            foreach ($this->request->responsables as $responsable) {

                Responsable::create([
                    'employee_id' => $responsable,
                    'model_id' => $item->id,
                    'model_type' => 'App\Models\Item'
                ]);

            }
        }


        ItemTaxe::where("item_id", $item->id)->delete();
        if (!empty($this->request->item_taxes)) {
            foreach ($this->request->item_taxes as $ix) {

                ItemTaxe::create([
                    'tax_id' => $ix,
                    'item_id' => $item->id
                ]);

            }
        }


        ItemVariation::where('item_id', $id)->delete();

        if ($this->request->has('variations') && !empty($this->request->variations)) {

            $counter = 0;

            foreach ($this->request->variations as $variationId => $value) {

                $variation = Variation::where('id', $variationId)->first();

                if ($variation) {

                    $itemVariationData = [
                        'variation_id' => $variation->id,
                        'item_id' => $item->id,
                        'label_ar' => $variation->label_ar,
                        'label_en' => $variation->label_en,
                        'name' => $variation->name,
                        'type' => $variation->type,
                        'options' => $variation->options,
                        'value_ar' => $value,
                        'value_en' => $value,
                    ];

                    ItemVariation::create($itemVariationData);

                }
                var_dump($variationId);

                $counter++;
            }
        }


        DB::commit();


        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');
    }


    public function destroy($id)
    {
 
     
       $itemsordercount= SalesOrderItem::where('item_id',$id)->count();
       $itemsinvoicecount= SalesInvoiceItem::where('item_id',$id)->count();
       $itemspurchasecount= PurchaseInvoiceItem::where('item_id',$id)->count();

       if($itemsordercount > 0 || $itemsinvoicecount > 0 || $itemspurchasecount > 0){
        $response = [
	        'status' => (int)0,
	        'message' => trans('main.deleted_item_before_delted_sales_order_item_or_sales_invoice_item_or_purchase_invoice_item'),
	        'data' => [],
	    ];
        return response()->json($response);
       }else{
        Responsable::where('model_type', 'App\Models\Item')->where("model_id", $id)->delete();
        ItemVariation::where('item_id', $id)->delete();
        return parent::destroy($id);
       }

    }

    public function initial_responsables($resources)
    {
        if (Auth()->user() && !Auth()->user()->is_super_admin) {
            $resources = $resources->leftjoin('responsables as res', 'items.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\Item")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupby("items.id")
                ->select(["items.*"]);
        }

        return $resources;
    }
}
