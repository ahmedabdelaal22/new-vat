<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class RolePermission extends Model
{


    protected $table = 'role_has_permissions';

    protected $fillable = [
        'role_id', 'permission_id'
    ];

    public function scopeSearch($query){

    	return $query;
    }
}
