<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use App\Models\User;
use Illuminate\Support\Facades\Password;


class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */

    use SendsPasswordResetEmails;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }




    public function AppServiceSendResetLinkEmail(Request $request)
    {
        $json_response = array();
        $json_response['success'] =false;
        $json_response['error_code'] ='email_not_exist';
        print_r("asd");exit;
        Config(['auth.defaults.passwords' => 'users']);

        $email=$request->input('email');

        if($email){
            $user = User::where('email',$email)->where('deleted_at',null)->first();
            if (!$user or $email==""){
                $json_response['success'] =false;
                $json_response['error_code'] ='email_not_exist';
            }
//		$this->validateSendResetLinkEmail($request);

            $broker = $this->getBroker();

            $response = Password::broker($broker)->sendResetLink(
                $this->getSendResetLinkEmailCredentials($request),
                $this->resetEmailBuilder()
            );



            switch ($response) {
                case Password::RESET_LINK_SENT:
                    $json_response['success'] =true; $json_response['error_code'] =''; break;/*$this->getSendResetLinkEmailSuccessResponse($response)*/;
                case Password::INVALID_USER:
                    $json_response['success'] =false;$json_response['error_code'] ='email_not_exist';break;
                default:
                    $json_response['success'] =false; /*$this->getSendResetLinkEmailFailureResponse($response)*/;
                    $json_response['error_code'] ='email_not_send_right';
            }


        }

        return response()->json($json_response);
    }

}
