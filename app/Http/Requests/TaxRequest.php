<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TaxRequest extends FormRequest
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
            'name'=>'required',
            'value'=>'required',
            'type'=>'required',
        ];
    }

    public function messages(){
        return [
            'name.required'=>trans('validation.name.required'),
            'value.required'=>trans('validation.value.required'),
            'type.required'=>trans('validation.type.required'),
        ];
    }
}
