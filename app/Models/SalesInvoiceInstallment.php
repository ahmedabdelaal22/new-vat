<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class SalesInvoiceInstallment extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    //
    protected $table='sales_invoice_installments';
    protected $fillable = [
        'client_id', 'invoice_id', 'amount', 'date', 'notes', 'status'
    ];

    public function scopeSearch($query){

    	if (request()->has('search_query') && !empty(request()->search_query)) {

    		$query = $query->where(function($q){
    			$q->whereHas('client_user',function($q1){
    				$q1->where('name','like','%'.request()->search_query.'%');
    			});

    			$q->orWhereHas('invoice',function($q1){
    				$q1->where('code','like','%'.request()->search_query.'%');
    			});

    		});
    	}


        if (request()->has('client_id') && !empty(request()->client_id)) {

            $query = $query->where('client_id', '=', request()->client_id);
        }


        if (request()->has('sale_invoice_id') && !empty(request()->sale_invoice_id)) {

            $query = $query->where('invoice_id', '=', request()->sale_invoice_id);
        }

    	return $query;
    }

    public function client_user(){
    	return $this->belongsTo(Client::class,'client_id');
    }

    public function invoice(){
    	return $this->belongsTo(SalesInvoice::class,'invoice_id');
    }
}
