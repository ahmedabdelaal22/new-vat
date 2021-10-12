<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ItemTaxe extends Model
{
    // `id`, `item_id`, `tax_id`, `created_at`, `updated_at` FROM `item_taxes
    protected $table = 'item_taxes';

    protected $fillable = [
    	'item_id','tax_id'
    ];
}
