<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Item extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $table = 'items';

    protected $fillable = [
        'category_id','unitType','itemCode', 'name_ar', 'name_en', 'unit_price', 'purchase_price', 'sale_price', 'notes',
    ];

    protected $appends = [
        'name'
    ];

    public function getNameAttribute(){

        if (App()->getLocale() == 'en') {
            return $this->name_en;
        }

        return $this->name_ar;
    }

    public function category()
    {
        return $this->belongsTo(ItemCategory::class, 'category_id');
    }

    public function item_variations()
    {
        return $this->hasMany(ItemVariation::class, 'item_id');
    }

    public function responsables()
    {
        return  Responsable::where('model_type', '=','App\Models\Item')->where("model_id",$this->id)->pluck("employee_id")->toArray();

    }
    public function taxes()
    {
        return  ItemTaxe::where("item_id",$this->id)->pluck("tax_id")->toArray();

    }
    public function scopeSearch($query)
    {
        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('name_'.App()->getLocale(), 'like', '%' . request()->search_query . '%');
        }

        if (request()->has('category_id') && !empty(request()->category_id)) {
            $query = $query->where('category_id', '=', request()->category_id);
        }


        return $query;
    }

}
