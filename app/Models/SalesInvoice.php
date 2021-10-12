<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use Carbon\Carbon;

class SalesInvoice extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    public $table = 'sales_invoices';
    protected $fillable = [
        'client_id', 'code', 'sales_order_id', 'inventory_id', 'total', 'final_total', 'total_after_discount', 'discount', 'payment_type', 'discount_type', 'discount_amount', 'total_taxes_amount', 'paid_amount', 'remaining_amount', 'status', 'confirmed_by', 'confirmed_at', 'notes'
        
        , 'date','currency_id','uuid'
    ];

    public function scopeSearch($query)
    {

        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('sales_invoices.code', 'like', '%' . request()->search_query . '%')
                ->orWhere('sales_invoices.notes', 'like', '%' . request()->search_query . '%');
        }

        // date btw
        if ((request()->has('date_start') && !empty(request()->date_start))) {
            $query = $query->where(function ($q) use ($query) {
                $query->where('sales_invoices.date', '>=', Carbon::parse(request()->date_start));
            });

        }

        if ((request()->has('date_end') && !empty(request()->date_end))) {
            $query = $query->where(function ($q) use ($query) {
                $query->where('sales_invoices.date', '<=', Carbon::parse(request()->date_end));
            });

        }
        if ((request()->has('confirmed_start') && !empty(request()->confirmed_start))) {
            $query = $query->where(function ($q) use ($query) {
                $query->where('sales_invoices.confirmed_at', '>=', Carbon::parse(request()->confirmed_start));
            });

        }

        if ((request()->has('confirmed_end') && !empty(request()->confirmed_end))) {
            $query = $query->where(function ($q) use ($query) {
                $query->where('sales_invoices.confirmed_at', '<=', Carbon::parse(request()->confirmed_end));
            });

        }

        // final_total  btw
        if (request()->has('final_total_start') && !empty(request()->final_total_start)) {
            $query = $query->where(function ($condition) {
                $condition->where('sales_invoices.final_total', '>=', request()->final_total_start);
            });
        }

        if (request()->has('final_total_end') && !empty(request()->final_total_end)) {
            $query = $query->where(function ($condition) {
                $condition->where('sales_invoices.final_total', '<=', request()->final_total_end);
            });
        }

        // paid_amount  btw
        if (request()->has('paid_amount_start') && !empty(request()->paid_amount_start)) {
            $query = $query->where(function ($condition) {
                $condition->where('sales_invoices.paid_amount', '>=', request()->paid_amount_start);
            });
        }

        if (request()->has('paid_amount_end') && !empty(request()->paid_amount_end)) {
            $query = $query->where(function ($condition) {
                $condition->where('sales_invoices.paid_amount', '<=', request()->paid_amount_end);
            });
        }

        // remaining_amount  btw
        if (request()->has('remaining_amount_start') && !empty(request()->remaining_amount_start)) {
            $query = $query->where(function ($condition) {

                $condition->where('sales_invoices.remaining_amount', '>=', request()->remaining_amount_start);
            });
        }


        // remaining_amount  btw
        if (request()->has('remaining_amount_end') && !empty(request()->remaining_amount_end)) {
            $query = $query->where(function ($condition) {
                $condition->where('sales_invoices.remaining_amount', '<=', request()->remaining_amount_end);
            });
        }

        if (request()->has('client_id') && !empty(request()->client_id)) {

            $query = $query->where('sales_invoices.client_id', '=', request()->client_id);
        }


        if (request()->has('payment_type') && !empty(request()->payment_type)) {

            $query = $query->where('sales_invoices.payment_type', '=', request()->payment_type);
        }
        if (request()->has('inventory_id') && !empty(request()->inventory_id)) {

            $query = $query->where('sales_invoices.inventory_id', '=', request()->inventory_id);
        }

        if (request()->has('responsables') && !empty(request()->responsables)) {
            $query = $query->join('responsables', 'sales_invoices.id', '=', 'responsables.model_id')->where('responsables.model_type', '=', "App\\Models\\SalesInvoice")->whereIn("responsables.employee_id", request()->responsables);

        }

        if (request()->has('item_id') && !empty(request()->item_id)) {

            $query = $query->join('sales_invoice_items', 'sales_invoices.id', '=', 'sales_invoice_items.invoice_id')
                ->join('items', 'sales_invoice_items.item_id', '=', 'items.id')
                ->where("items.id", request()->item_id);

        }

   


        return $query;
    }


    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id');
    }
    public function currency()
    {
        return $this->belongsTo(Currency::class, 'currency_id');
    }

    public function inventory()
    {
        return $this->belongsTo(Inventory::class, 'inventory_id');
    }


    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function items()
    {
        return $this->hasMany(SalesInvoiceItem::class, 'invoice_id');
    }

    public function installments()
    {
        return $this->hasMany(SalesInvoiceInstallment::class, 'invoice_id');
    }

    public function taxes()
    {
        return $this->hasMany(SalesInvoiceTaxes::class, 'sales_invoice_id');
    }

    public function responsables()
    {
        return Responsable::where('model_type', '=', 'App\Models\SalesInvoice')->where("model_id", $this->id)->pluck("employee_id")->toArray();

    }



}
