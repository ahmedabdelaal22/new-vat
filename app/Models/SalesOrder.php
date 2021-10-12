<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class SalesOrder extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table = 'sales_orders';
    protected $fillable = [
        'client_id', 'code', 'date', 'inventory_id', 'created_by', 'total', 'final_total', 'total_after_discount', 'discount'
        , 'payment_type' 
        , 'discount_type', 'discount_amount',
        'total_taxes_amount', 'paid_amount', 'remaining_amount', 'status', 'confirmed_by', 'confirmed_at', 'notes'
    ];

    public function scopeSearch($query)
    {
        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('sales_orders.code', 'like', '%' . request()->search_query . '%')
                ->orWhere('sales_orders.notes', 'like', '%' . request()->search_query . '%');
        }

        // date btw
        if ((request()->has('date_start') && !empty(request()->date_start))) {
            $query = $query->where(function ($q) use ($query) {
                $query->where('sales_orders.date', '>=', Carbon::parse(request()->date_start));
            });
        }

        if (request()->has('date_end') && !empty(request()->date_end)) {
            $query = $query->where(function ($q) use ($query) {

                $query->where('sales_orders.date', '<=', Carbon::parse(request()->date_end));

            });
        }


        // final_total  btw
        if ((request()->has('final_total_start') && !empty(request()->final_total_start))) {
            $query = $query->where(function ($condition) {
                $condition->where('sales_orders.final_total', '>=', request()->final_total_start);
            });
        }

        if (request()->has('final_total_end') && !empty(request()->final_total_end)) {
            $query = $query->where(function ($condition) {

                $condition->where('sales_orders.final_total', '<=', request()->final_total_end);

            });
        }

   
        if (request()->has('client_id') && !empty(request()->client_id)) {

            $query = $query->where('sales_orders.client_id', '=', request()->client_id);
        }

        if (request()->has('inventory_id') && !empty(request()->inventory_id)) {

            $query = $query->where('sales_orders.inventory_id', '=', request()->inventory_id);
        }
 
        if (request()->has('responsables') && !empty(request()->responsables)) {
            $query = $query->join('responsables', 'sales_orders.id', '=', 'responsables.model_id')->where('responsables.model_type', '=', "App\\Models\\SalesOrder")->whereIn("responsables.employee_id", request()->responsables);

        }

        if (request()->has('item_id') && !empty(request()->item_id)) {

            $query = $query->join('sales_order_items', 'sales_orders.id', '=', 'sales_order_items.invoice_id')
            ->join('items', 'sales_order_items.item_id', '=', 'items.id')
            ->where("items.id", request()->item_id);

        }
        return $query;
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }


    public function confirmer()
    {
        return $this->belongsTo(User::class, 'confirmed_by');
    }

    public function client_user()
    {
        return $this->belongsTo(Client::class, 'client_id');
    }


    public function inventory()
    {
        return $this->belongsTo(Inventory::class, 'inventory_id');
    }


    public function items()
    {
        return $this->hasMany(SalesOrderItem::class, 'invoice_id');
    }

    public function responsables()
    {
        return  Responsable::where('model_type', '=','App\Models\SalesOrder')->where("model_id",$this->id)->pluck("employee_id")->toArray();
    }
}
