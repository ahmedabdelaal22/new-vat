<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class ItemVariation extends Model implements Auditable
{

    use \OwenIt\Auditing\Auditable;

    protected $table='item_variations';
    protected $fillable = [
        'variation_id', 'item_id','label_ar','label_en', 'name', 'type', 'options', 'value_ar','value_en'
    ];

    public function item(){
    	return $this->belongsTo(Item::class,'item_id');
    }



    public function variation(){
    	return $this->belongsTo(Variation::class,'variation_id');
    }

    public function scopeSearch($query){

        return $query;
    }
}
