<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class SalesOrderItem extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    //
    protected $table='sales_order_items';
    protected $fillable = [
        'item_id', 'inventory_id', 'invoice_id', 'amount', 'price', 'unit_price', 'sale_price', 'purchase_price', 'notes'
    ];
    
    public function item(){
    	return $this->belongsTo(Item::class,'item_id');
    }
    
    public function scopeSearch($query){

    	return $query;
    }
}
