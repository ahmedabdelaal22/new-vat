<?php

namespace App\Http\Controllers;
use App\Helper\Helper;
use App\Models\LeadOperation;
use App\Models\Lead;
use App\Models\EInvoicingSDK;
use Illuminate\Http\Request;
use View;
use Symfony\Component\HttpFoundation\Session\Session;

class CalenderController extends Controller
{
	


	public function __construct(){
        $session = new Session();
        session()->put('generatedAccessToken', $session->get('generatedAccessToken'));

            session()->save();
        
	}

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     public function loginInvoice(){

        $params['grant_type']='client_credentials';
        $params['client_id']="44eb0d70-14ad-4643-88cb-dea997b0f15b";
        $params["client_secret"]="8322a235-5b35-4091-8a5d-876113481e34";
        $params["scope"]="InvoicingAPI";
        $inv=new EInvoicingSDK();
        $url='/connect/token';
        $data= $inv->post($url,$params);

        $data=json_decode( $data);
        
      //  $this->generatedAccessToken=
    //   session()->put('SKDToken', $data->access_token);

    //       session()->save();

    if($data){
        if(@$data->error){
            toastr()->success($data->error);
        }else{
            $session = new Session();
            $session->set('generatedAccessToken', @$data->access_token);
            toastr()->success(trans('main.login_in_sdk_invoice'));
        }
   
    }else{
        toastr()->success(trans('main.againlogin'));
    }



   
    

    return redirect()->back();
   
     }

public function logoutInvoice(){
    $session = new Session();
    $session->set('generatedAccessToken', '');
    session()->forget('generatedAccessToken');
             session()->save();

    return redirect()->back();
}




    public function index(Request $request)
    {
        return view('home');
    }
    public function ajax_json(){

        // $leads=Lead::

        //   leftjoin('responsables as res', 'leads.id', '=', 'res.model_id')
        //     ->where(function($q){  
        //       if (Auth()->user() && !Auth()->user()->is_super_admin) { 
        //                    $q ->where('res.model_type', '=', "App\\Models\\Lead")
        //                     ->where(function ($q) {
        //                         $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

        //                         $q->where("res.employee_id", Auth()->user()->id);
        //                         $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
        //                     })  ;
        //             }
        //     })
        //    ->distinct()->select(["leads.*"]) 



        // ->get();
        // $response=array();

        //    foreach($leads as $lead){
        //         foreach($lead->operations as $operation){
        //        $response[]=
        // [
        //     "title"=> $lead->title,
        //     "start"=>$operation->operation_date.'T'.$operation->operation_time,
        //     "url"=>route('leads.show',$lead->id),
        //     "description"=> $lead->details,
        //     "className"=> "m-fc-event--danger m-fc-event--solid-warning"  
        // ];
        //    }
        //   }
        // $response[]=
        //     [
        //         "title"=> 'All Day Event',
        //         "start"=> '2020-06-01',
        //         "url"=>'http://google.com/',
        //         "description"=> 'Lorem ipsum dolor sit incid idunt ut',
        //         "className"=> "m-fc-event--danger m-fc-event--solid-warning"  
        //     ];

     //   return response()->json($response);
    }






}
