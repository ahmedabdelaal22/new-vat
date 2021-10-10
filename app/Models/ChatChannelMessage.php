<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class ChatChannelMessage extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table='chat_channel_messages';
    protected $fillable = [
        'from_id', 'to_id', 'message', 'seen'
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
