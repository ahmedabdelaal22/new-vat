<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LeadOperationRequest extends FormRequest
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
            'lead_id'=>'required|numeric',
            'user_id'=>'required|numeric',
            'connection_way_id'=>'required|numeric',
            'operation_date'=>'required|date',
            'operation_time'=>'required',
            'responsables'=>'required'
        ];
    }

    public function messages(){
        return [

            'lead_id.required'=>trans('validation.lead_id.required'),
            'lead_id.numeric'=>trans('validation.lead_id.required'),
            'user_id.required'=>trans('validation.user_id.required'),
            'user_id.numeric'=>trans('validation.user_id.required'),
            'connection_way_id.required'=>trans('validation.connection_way_id.required'),
            'connection_way_id.numeric'=>trans('validation.connection_way_id.required'),
            'operation_date.required'=>trans('validation.operation_date.required'),
            'operation_date.date'=>trans('validation.operation_date.required'),
            'operation_time.required'=>trans('validation.operation_time.required'),
            'responsables.required'=>trans('validation.responsables.required')

        ];
    }
}
