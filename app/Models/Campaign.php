<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Campaign extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $table = 'campaigns';
    protected $fillable = [
        'title', 'details', 'page_id', 'post_id'
    ];

    public function campaigncomments()
    {
        return $this->hasMany(CampaignComment::class, 'campaign_id');
    }

    public function scopeSearch($query)
    {

        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('title', 'like', '%' . request()->search_query . '%')
                ->orWhere('details', 'like', '%' . request()->search_query . '%');

        }

        return $query;
    }
}

