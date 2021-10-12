<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Client extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table='clients';
    protected $fillable = [
        'balance','category_id', 'name', 'email', 'user_name', 'password', 'job', 'birth_date', 'address', 'referred_by'
        , 'notes', 'receiver_id', 'receiver_type', 'address_country', 'address_additionalInformation', 'address_landmark', 'address_room', 'address_floor', 'address_postalCode', 'address_buildingNumber', 'address_street', 'address_regionCity', 'address_governate'
    ];

    protected $appends = [
        'client_balnce'
    ];
    public function getClientBalnceAttribute(){
        return $this->name .' : '.$this->balance;
    }

    public function category(){
    	return $this->belongsTo(ClientCategory::class,'category_id');
    }

    public function phones(){
    	return $this->hasMany(ClientContact::class,'client_id');
    }
    public function sales_orders(){
   	return $this->hasMany(SalesOrder::class,'client_id');
    }
    public function sales_invoices(){
    	return $this->hasMany(SalesInvoice::class,'client_id');
    } 

    public function collection(){
    	return $this->hasMany(Collection::class,'client_id');
    } 
    


    public function responsables(){
        return  Responsable::where('model_type', '=','App\Models\Client')->where("model_id",$this->id)->pluck("employee_id")->toArray();

    }

    public function scopeSearch($query){

        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('name', 'like', '%' . request()->search_query . '%')
                ->orWhere('email', 'like', '%' . request()->search_query . '%');
        }
        return $query;
    }
}
