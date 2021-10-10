<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use Carbon\Carbon;
class PurchaseInvoice extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table = 'purchase_invoices';

    protected $fillable = [
        'supplier_id', 'code', 'purchase_invoice_number', 'inventory_id', 'total', 'final_total', 'total_after_discount', 'discount', 'payment_type', 'discount_type', 'discount_amount', 'total_taxes_amount', 'paid_amount', 'remaining_amount', 'status', 'confirmed_by', 'confirmed_at', 'notes', 'created_by', 'date'
    ];

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }


    public function confirmer()
    {
        return $this->belongsTo(User::class, 'confirmed_by');
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class, 'supplier_id');
    }


    public function inventory()
    {
        return $this->belongsTo(Inventory::class, 'inventory_id');
    }


    public function items()
    {
        return $this->hasMany(PurchaseInvoiceItem::class, 'invoice_id');
    }

    public function installments()
    {
        return $this->hasMany(PurchaseInstallment::class, 'invoice_id');
    }


    public function scopeSearch($query)
    {

        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('code', 'like', '%' . request()->search_query . '%')
                ->orWhere('notes', 'like', '%' . request()->search_query . '%')
                ->orWhere('purchase_invoice_number', 'like', '%' . request()->search_query . '%');
        }


        // date btw
        if (request()->has('date_start') && !empty(request()->date_start)) {
            $query = $query->where(function ($q) use ($query) {
                $query->where('date', '>=', Carbon::parse(request()->date_start));
            });
        }


        if (request()->has('date_end') && !empty(request()->date_end)) {
            $query = $query->where(function ($q) use ($query) {
                $query->where('date', '<=', Carbon::parse(request()->date_end));

            });
        }

        // final_total  btw
        if (request()->has('final_total_start') && !empty(request()->final_total_start)) {
            $query = $query->where(function ($condition) {
                $condition->where('final_total', '>=', request()->final_total_start);
            });
        }

        if (request()->has('final_total_end') && !empty(request()->final_total_end)) {
            $query = $query->where(function ($condition) {
                $condition->where('final_total', '<=', request()->final_total_end);
            });
        }

        // paid_amount  btw
        if (request()->has('paid_amount_start') && !empty(request()->paid_amount_start)) {
            $query = $query->where(function ($condition) {
                $condition->where('paid_amount', '>=', request()->paid_amount_start);
            });
        }

        if (request()->has('paid_amount_end') && !empty(request()->paid_amount_end)) {
            $query = $query->where(function ($condition) {
                $condition->where('paid_amount', '<=', request()->paid_amount_end);
            });
        }



        // remaining_amount  btw
        if (request()->has('remaining_amount_start') && !empty(request()->remaining_amount_start)) {
            $query = $query->where(function ($condition) {
                $condition->where('remaining_amount', '>=', request()->remaining_amount_start);
            });
        }

        if (request()->has('remaining_amount_end') && !empty(request()->remaining_amount_end)) {

            $query = $query->where(function ($condition) {
                $condition->where('remaining_amount', '<=', request()->remaining_amount_end);
            });
        }

        if (request()->has('supplier_id') && !empty(request()->supplier_id)) {

            $query = $query->where('supplier_id', '=', request()->supplier_id);
        }

        if (request()->has('inventory_id') && !empty(request()->inventory_id)) {

            $query = $query->where('inventory_id', '=', request()->inventory_id);
        }


        return $query;
    }

    public function responsables()
    {
        return  Responsable::where('model_type', '=','App\Models\PurchaseInvoice')->where("model_id",$this->id)->pluck("employee_id")->toArray();

    }

}
