<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class ItemCategory extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $table='item_categories';
    protected $fillable = [
        'parent_id', 'name_ar','name_en', 'notes'
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

    public function parent_category(){
    	return $this->belongsTo(ItemCategory::class,'parent_id');
    }

    public function categories(){
    	return $this->hasMany(ItemCategory::class,'parent_id');
    }

    public function scopeSearch($query)
    {
        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('name_'.App()->getLocale(), 'like', '%' . request()->search_query . '%')
                ->orWhere('notes', 'like', '%' . request()->search_query . '%');
        }
        return $query;
    }




}
