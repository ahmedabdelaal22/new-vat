<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    protected $table = 'currency';
//`name`, `code`, `symbol`, `amount`
    protected $fillable = [
    	'name','code','symbol','amount'
    ];
}
