<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SaleInvoiceRequest extends FormRequest
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
            'client_id'=>'required|numeric',
            'code'=>'required',
            'inventory_id'=>'required|numeric',
            'discount'=>'nullable|numeric',
            'payment_type'=>'required',
            'discount_type'=>'required',
            'discount_amount'=>'nullable|numeric|max:999999',
            'paid_amount'=>'nullable|numeric',
            'date'=>'required|date',
            'invoice_items'=>'required|array',
            'invoice_items.item_id.*'=>'required|numeric',
            'invoice_items.amount.*'=>'required|numeric|min:1|max:999999',
            'invoice_items.sale_price.*'=>'required|numeric|min:0|max:999999',
            'responsables'=>'required',
        ];
    }

    public function messages(){
        return [

            'client_id.required'=>trans('validation.client_id.required'),
            'client_id.numeric'=>trans('validation.client_id.required'),
            'code.required'=>trans('validation.code.required'),
            'inventory_id.required'=>trans('validation.inventory_id.required'),
            'inventory_id.numeric'=>trans('validation.inventory_id.required'),
            'discount.numeric'=>trans('validation.discount.required'),
            'payment_type.required'=>trans('validation.payment_type.required'),
            'discount_type.required'=>trans('validation.discount_type.required'),
            'discount_amount.numeric'=>trans('validation.discount_amount.required'),
            'discount_amount.max'=>trans('validation.discount_amount.max'),
            'paid_amount.numeric'=>trans('validation.paid_amount.required'),
            'date.required'=>trans('validation.date.required'),
            'date.date'=>trans('validation.date.required'),
            //
            'invoice_items.required'=>trans('validation.invoice_items.required'),
            'invoice_items.array'=>trans('validation.invoice_items.required'),

            'invoice_items.item_id.numeric'=>trans('validation.invoice_items.item_id.required'),
            'invoice_items.item_id.required'=>trans('validation.invoice_items.item_id.required'),
            'invoice_items.item_id.*.numeric'=>trans('validation.invoice_items.item_id.numeric'),
            'invoice_items.item_id.*.required'=>trans('validation.invoice_items.item_id.required'),

            'invoice_items.amount.*.required'=>trans('validation.invoice_items.amount.required'),
            'invoice_items.amount.*.numeric'=>trans('validation.invoice_items.amount.required'),
            'invoice_items.amount.*.max'=>trans('validation.invoice_items.amount.max'),
            'invoice_items.amount.*.min'=>trans('validation.invoice_items.amount.min'),

            'invoice_items.sale_price.*.required'=>trans('validation.invoice_items.sale_price.required'),
            'invoice_items.sale_price.*.numeric'=>trans('validation.invoice_items.sale_price.required'),
            'invoice_items.sale_price.*.max'=>trans('validation.invoice_items.sale_price.max'),
            'responsables.required'=>trans('validation.responsables.required'),

        ];
    }
}
