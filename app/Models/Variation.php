<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Variation extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $table='variations';
    protected $fillable = [
        'label_ar','label_en','value_ar','value_en','name', 'type','options'
    ];

    public function scopeSearch($query){

    	return $query;
    }
}
