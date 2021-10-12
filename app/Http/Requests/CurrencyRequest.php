<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CurrencyRequest extends FormRequest
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

    /**	'name','code','symbol','amount'
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'=>'required',
            'code'=>'required',
            'symbol'=>'required',
            'amount'=>'required',
        ];
    }

    public function messages(){
        return [
            'name.required'=>trans('validation.name.required'),
            'code.required'=>trans('validation.code.required'),
            'symbol.required'=>trans('validation.symbol.required'),
            'amount.required'=>trans('validation.amount.required'),
     
        ];
    }
}
