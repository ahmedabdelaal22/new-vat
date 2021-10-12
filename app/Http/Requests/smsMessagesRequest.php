<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class smsMessagesRequest extends FormRequest
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
    public function rules($id = null)
    {
        return [
            'message' => 'required|string|max:191',
            'phones.*'=>'required'
     ];
    }

    public function messages(){
        return [
            'message.required'=>trans('validation.message.required'),
            'contacts.phones.numeric'=>trans('validation.phones.numeric'),
            'phones.unique'=>trans('validation.phones.unique')
        ];
    }
}
