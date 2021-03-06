<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CampaignRequest extends FormRequest
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
            'title'=>'required',
            'page_id'=>'required',
            'post_id'=>'required',
        ];
    }

    public function messages(){
        return [
            'title.required'=>trans('validation.title.required'),
            'page_id.required'=>trans('validation.page_id.required'),
            'post_id.required'=>trans('validation.post_id.required'),
        ];
    }
}
