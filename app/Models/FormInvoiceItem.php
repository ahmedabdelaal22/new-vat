<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class FormInvoiceItem extends Item  implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $appends = [
    	'name'
    ];

    public function getNameAttribute(){

    	$name = '';

    	if ($this->category) {
    		$name .= $this->category->name.' - ';
    	}
        
        if (App()->getLocale() == 'en') {
            
    	   $name .= $this->name_en;

        }else{
            
            $name .= $this->name_ar;
        }

    	return $name;
    }

    public function scopeSearch($query){

        return $query;
    }

}
