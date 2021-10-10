<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Inventory extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //

     public $table = 'inventories';

    protected $fillable = [
        'name_ar','name_en', 'phone', 'address', 'notes'
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


    public function scopeSearch($query)
    {

        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('name_'.App()->getLocale(), 'like', '%' . request()->search_query . '%')
                ->orWhere('phone', 'like', '%' . request()->search_query . '%')
                ->orWhere('address', 'like', '%' . request()->search_query . '%')
                ->orWhere('notes', 'like', '%' . request()->search_query . '%');
        }
        return $query;
    }

    public function responsables()
    {
        return  Responsable::where('model_type', '=','App\Models\Inventory')->where("model_id",$this->id)->pluck("employee_id")->toArray();

    }
}
