<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class   ClientContact extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table = 'client_contacts';
    protected $fillable = [
        'client_id', 'phone', 'notes'
    ];

    protected $appends = [
        'contact_info','contact_id'
    ];

    public function getContactInfoAttribute(){
        return optional($this->client)->name .' '.$this->phone;
    }
    public function getContactIdAttribute(){
        return optional($this->client)->id .','.$this->phone;
    }
    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id');
    }

    public function scopeSearch($query)
    {

        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('phone', 'like', '%' . request()->search_query . '%')
                ->orWhere('notes', 'like', '%' . request()->search_query . '%');
        }


        if (request()->has('client_id') && !empty(request()->client_id)) {

            $query = $query->where('client_id', '=', request()->client_id);
        }


        return $query;
    }
}
