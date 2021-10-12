<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class ClientInterest extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table='client_interests';
    protected $fillable = [
        'client_id', 'details'
    ];

    public function scopeSearch($query){

    	return $query;
    }
}
