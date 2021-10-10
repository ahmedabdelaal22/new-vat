<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class CampaignComment extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    //
    protected $table='campaign_comments';
    protected $fillable = [
        'campaign_id', 'page_id', 'post_id', 'comment'
    ];


    public function scopeSearch($query){

    	return $query;
    }
}
