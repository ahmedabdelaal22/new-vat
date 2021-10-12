<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class InventoryItem extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table = 'inventory_items';
    protected $fillable = [
        'inventory_id', 'item_id', 'amount', 'unit_price', 'purchase_price', 'sale_price',
    ];

    public function inventory()
    {
        return $this->belongsTo(Inventory::class, 'inventory_id');
    }

    public function item()
    {
        return $this->belongsTo(Item::class, 'item_id');
    }

    public function scopeSearch($query)
    {


        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('sale_price', 'like', '%' . request()->search_query . '%')
                ->orWhere("purchase_price",'like',"%".request()->search_query."%")
                ->orWhere("unit_price",'like',"%".request()->search_query."%")
                ->orWhere("amount",'like',"%".request()->search_query."%");
        }


        // amount btw
        if ((request()->has('amount_start') && !empty(request()->amount_start)) or (request()->has('amount_end') && !empty(request()->amount_end))) {
            $query = $query->where(function ($q) use ($query) {
                if ((request()->has('amount_start') && !empty(request()->amount_start))) $query->where('amount', '>=', request()->amount_start);

                if (request()->has('amount_end') && !empty(request()->amount_end)) $query->where('amount', '<=', request()->amount_end);

            });
        }


        if (request()->has('item_id') && !empty(request()->item_id)) {

            $query = $query->where('item_id', '=', request()->item_id);
        }

        if (request()->has('inventory_id') && !empty(request()->inventory_id)) {

            $query = $query->where('inventory_id', '=', request()->inventory_id);
        }


        return $query;
    }


    public function formitem()
    {
        return $this->belongsTo(FormInvoiceItem::class, 'item_id');
    }

}
