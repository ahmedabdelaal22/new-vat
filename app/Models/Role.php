<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role as PackageRole;

class Role extends PackageRole

{


    protected $fillable = ['name_ar','name_en','name', 'guard_name'];


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
            $query = $query->where('name_'.App()->getLocale(), 'like', '%' . request()->search_query . '%');

        }

        return $query;
    }
}
