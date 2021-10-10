<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CampaignCommentRequest extends FormRequest
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
            'comment'=>'required',
            'campaign_id'=>'required',
            'page_id'=>'required',
            'post_id'=>'required',
        ];
    }

    public function messages(){
        return [
            'comment.required'=>trans('validation.comment.required'),
            'campaign_id.required'=>trans('validation.campaign_id.required'),
            'page_id.required'=>trans('validation.page_id.required'),
            'post_id.required'=>trans('validation.post_id.required'),
        ];
    }
    
}
