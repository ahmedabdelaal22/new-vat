<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LeadNoteRequest extends FormRequest
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
            'lead_id'=>'required',
            'details'=>'required',
        ];
    }

    public function messages(){
        return [
            'lead_id.required'=>trans('validation.lead_id.required'),
            'details.required'=>trans('validation.details.required')

        ];
    }
}
