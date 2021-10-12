<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MarketingWayRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name_ar'=>'required',
            'name_en'=>'required',
        ];
    }

    public function messages(){
        return [
            'name_ar.required'=>trans('validation.name_ar.required'),
            'name_en.required'=>trans('validation.name_en.required'),
        ];
    }

}
