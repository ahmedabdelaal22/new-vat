<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class ChatChannel extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table='chat_channels';
    
    protected $fillable = [
        'from_id', 'to_id'
    ];


    
    public function scopeSearch($query){

    	return $query;
    }



    public function from(){
    	return $this->belongsTo(User::class,'from_id');
    }

    public function to(){
    	return $this->belongsTo(User::class,'to_id');
    }

}
