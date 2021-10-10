<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Responsable extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $table='responsables';
    protected $fillable = [
        'model_type', 'model_id','employee_id'
    ];


    public function model(){

        return $this->morphTo();

    }


}
