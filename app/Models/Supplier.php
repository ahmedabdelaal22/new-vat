<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Supplier extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table = 'suppliers';
    protected $fillable = [
        'name', 'email', 'address', 'phone', 'notes', 'initial_balance', 'balance'
    ];

    protected $appends = [
        'supplier_balnce'
    ];

    public function getSupplierBalnceAttribute()
    {
        return $this->name . ' : ' . $this->balance;
    }

    public function responsables()
    {
        return Responsable::where('model_type', '=', 'App\Models\Supplier')->where("model_id", $this->id)->pluck("employee_id")->toArray();

    }

    public function scopeSearch($query)
    {

        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('name', 'like', '%' . request()->search_query . '%');

            $query = $query->orWhere('email', 'like', '%' . request()->search_query . '%');

            $query = $query->orWhere('phone', 'like', '%' . request()->search_query . '%');

        }


        return $query;
    }

}
