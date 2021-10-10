<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Log extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $table = 'audits';

    protected $fillable = ['*'];

    protected $appends = [
        'type'
    ];

    public function getTypeAttribute()
    {
        return str_replace('App\\Models\\', '', $this->auditable_type);
    }

    public function scopeSearch($query)
    {
        if (request()->has('search_query') && !empty(request()->search_query)) {

            $query = $query->where('auditable_type', 'like', "%" . request()->search_query . "%");
        }

        if (request()->has('event') && !empty(request()->event)) {

            $query = $query->where('event', '=', request()->event);
        }

        if (request()->has('auditable_type') && !empty(request()->auditable_type)) {

            $query = $query->where('auditable_type', 'like', "%" . request()->auditable_type . "%");
        }

        if (request()->has('employee_id') && !empty(request()->employee_id)) {

            $query = $query->where('user_id', '=', request()->employee_id);
        }

        return $query;
    }
}
