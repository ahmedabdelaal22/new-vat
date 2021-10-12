<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ConnectionWayStatus extends Model
{
    protected $table = 'connection_way_statuses';

    protected $fillable = [
    	 'connection_way_id', 'name_ar', 'name_en'
    ];

    protected $appends = [
        'name'
    ];

    public function getNameAttribute(){
        
        if (App()->getLocale() == 'en') {
            return $this->name_en;
        }
        
        return $this->name_ar;
    }

}
