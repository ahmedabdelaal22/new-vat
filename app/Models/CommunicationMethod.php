<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class CommunicationMethod extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table='communication_method';
    protected $fillable = [  'name_ar','name_en'  ];

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
            $query = $query->where('name_'.App()->getLocale(), 'like', '%' . request()->search_query . '%') ;
        }

        return $query;
    }
}
