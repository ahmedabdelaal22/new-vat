<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
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
            'email' => 'required|email|max:191|unique:users,email,'.$id,
            'password' => ((isset($id))? 'nullable' : 'required').'|confirmed',
            'image' => 'nullable|image',
            'responsables' => 'required'
        ];
    }

    public function messages(){
        return [
            'name.required'=>trans('validation.name.required'),
            'email.required'=>trans('validation.email_.required'),
            'email.email'=>trans('validation.email_.email'),
            'email.unique'=>trans('validation.email_.unique'),
            'password.required'=>trans('validation.password_.required'),
            'password.confirmed'=>trans('validation.password_.confirmed'),
            'image.image'=>trans('validation.image_.image'),
            'responsables.required' => trans('validation.responsables.required')
        ];
    }
}
