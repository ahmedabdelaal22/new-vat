<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class PageMessage extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $table='page_messages';
    protected $fillable = [
        'page_id', 'message'
    ];

    public function scopeSearch($query){

    	return $query;
    }
}
