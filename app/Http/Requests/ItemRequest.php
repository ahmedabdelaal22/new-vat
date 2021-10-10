<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ItemRequest extends FormRequest
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
            'category_id'=>'required|numeric',
            'name_ar'=>'required',
            'name_en'=>'required',
            'unit_price'=>'required|numeric|max:999999',
            'purchase_price'=>'required|numeric|max:999999',
            'sale_price'=>'required|numeric|max:999999',
            'responsables'=>'required'
        ];
    }

    public function messages(){
        return [
            'name_ar.required'=>trans('validation.name_ar.required'),
            'name_en.required'=>trans('validation.name_en.required'),
            'category_id.required'=>trans('validation.category_id.required'),
            'category_id.numeric'=>trans('validation.category_id.required'),
            'unit_price.required'=>trans('validation.unit_price.required'),
            'unit_price.numeric'=>trans('validation.unit_price.required'),
            'unit_price.max'=>trans('validation.unit_price.max'),
            'purchase_price.required'=>trans('validation.purchase_price.required'),
            'purchase_price.numeric'=>trans('validation.purchase_price.required'),
            'purchase_price.max'=>trans('validation.purchase_price.max'),
            'sale_price.required'=>trans('validation.sale_price.required'),
            'sale_price.numeric'=>trans('validation.sale_price.required'),
            'sale_price.max'=>trans('validation.sale_price.max'),
            'responsables.required'=>trans('validation.responsables.required')

        ];
    }
}
