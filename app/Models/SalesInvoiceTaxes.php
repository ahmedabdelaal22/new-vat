<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SalesInvoiceTaxes extends Model
{
    protected $table = 'sales_invoice_taxes';

    protected $fillable = [
    	'sales_invoice_id', 'tax_id','tax_name', 'total', 'amount', 'tax_type'
    ];
    public function tax()
    {
        return $this->belongsTo(Tax::class, 'tax_id');
    }
}
