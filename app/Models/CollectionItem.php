<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CollectionItem extends Model
{
    protected $table = 'collection_items';

    protected $fillable = [
    	'collection_id', 'model_id', 'model_type', 'amount'
    ];

    public function scopeSearch($query){

    	return $query;
    }
}
