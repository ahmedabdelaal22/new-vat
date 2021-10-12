<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PaymentRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'supplier_id'=>'required|numeric',
            'amount'=>'required|numeric|max:999999',
            'date'=>'required|date'
        ];
    }

    public function messages(){
        return [


            'supplier_id.required'=>trans('validation.supplier_id.required'),
            'supplier_id.numeric'=>trans('validation.supplier_id.required'),
            'amount.required'=>trans('validation.amount.required'),
            'amount.numeric'=>trans('validation.amount.required'),
            'amount.max'=>trans('validation.amount.max'),
            'date.required'=>trans('validation.date.required'),
            'date.date'=>trans('validation.date.required')

        ];
    }
}
