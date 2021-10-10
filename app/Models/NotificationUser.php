<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class NotificationUser extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $table='notification_users';
    protected $fillable = [
        'user_id', 'notification_id', 'seen'
    ];

    public function scopeSearch($query){

    	return $query;
    }
}
