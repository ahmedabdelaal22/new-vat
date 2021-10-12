<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use Carbon\Carbon;

class Collection extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table = 'collections';
    protected $fillable = [
        'client_id', 'invoice_id', 'amount', 'date', 'notes', 'status', 'created_by', 'confirmed_by', 'confirmed_at'
    ];

    public function client_user()
    {
        return $this->belongsTo(Client::class, 'client_id');
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }


    public function confirmer()
    {
        return $this->belongsTo(User::class, 'confirmed_by');
    }


    public function scopeSearch($query)
    {

        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('status', 'like', '%' . request()->search_query . '%')
                ->orWhere('notes', 'like', '%' . request()->search_query . '%');
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

        // confirmed_at btw
        if (request()->has('confirmed_at_start') && !empty(request()->confirmed_at_start)) {
            $query = $query->where(function ($q) use ($query) {
                $query->where('confirmed_at', '>=',Carbon::parse(request()->confirmed_at_start));
            });
        }
        
        if (request()->has('confirmed_at_end') && !empty(request()->confirmed_at_end)) {
            $query = $query->where(function ($q) use ($query) {
               $query->where('confirmed_at', '<=', Carbon::parse(request()->confirmed_at_end));
            });
        }

        // amount btw
        if (request()->has('amount_start') && !empty(request()->amount_start)) {
            $query = $query->where(function ($q) use ($query) {
                $query->where('amount', '>=', request()->amount_start);
            });
        }

        if (request()->has('amount_end') && !empty(request()->amount_end)) {
            $query = $query->where(function ($q) use ($query) {
                $query->where('amount', '<=', request()->amount_end);
            });
        }

        if (request()->has('client_id') && !empty(request()->client_id)) {

            $query = $query->where('client_id', '=', request()->client_id);
        }

        if (request()->has('created_by') && !empty(request()->created_by)) {

            $query = $query->where('created_by', '=', request()->created_by);
        }

        if (request()->has('confirmed_by') && !empty(request()->confirmed_by)) {

            $query = $query->where('confirmed_by', '=', request()->confirmed_by);
        }


        return $query;
    }
}
