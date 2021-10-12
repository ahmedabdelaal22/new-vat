<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class PurchaseInstallment extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table = 'purchase_installments';
    protected $fillable = [
        'supplier_id', 'invoice_id', 'amount', 'date', 'notes', 'status'
    ];


    public function supplier()
    {
        return $this->belongsTo(Supplier::class, 'supplier_id');
    }


    public function invoice()
    {
        return $this->belongsTo(PurchaseInvoice::class, 'invoice_id');
    }

    public function scopeSearch($query)
    {

        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('notes', 'like', '%' . request()->search_query . '%')
            ->orWhere("amount",'like',"%".request()->search_query."%");
        }

        if (request()->has('purchase_invoice_id') && !empty(request()->purchase_invoice_id)) {
            $query = $query->where('invoice_id', '=', request()->purchase_invoice_id);
        }


        return $query;
    }

}
