<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Traits\HasPermissions;
use Spatie\Permission\Models\Permission as  PackagePermission;


class Permission extends PackagePermission
{


    public function scopeSearch($query){

    	return $query;
    }
}
