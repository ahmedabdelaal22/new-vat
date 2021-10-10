<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ClientRequest extends FormRequest
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
    public function rules($id = null)
    {
        return [
            'name' => 'required|string|max:191',
            'email' => 'required|email|max:191|unique:clients,email,' . $id,
            'contacts.*.phone' => 'nullable|numeric|unique:client_contacts,phone,'. $id.',client_id',
            'responsables' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'name.required' => trans('validation.name.required'),
            'email.required' => trans('validation.email_.required'),
            'email.email' => trans('validation.email_.email'),
            'email.unique' => trans('validation.email_.unique'),
            'contacts.*.phone.numeric' => trans('validation.phones.numeric'),
            'contacts.*.phone.unique' => trans('validation.phones.unique'),
            'responsables.required' => trans('validation.responsables.required')
        ];
    }
}
