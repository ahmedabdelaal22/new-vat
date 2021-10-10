<?php

namespace App\Models;

use Carbon\Carbon;
use PhpParser\Node\Expr\Cast\Double;
use Symfony\Component\HttpFoundation\Session\Session;
class EInvoicingSDK 
{

    public $apiBaseUrl;
    public $idSrvBaseUrl;
    public $clientId;
    public $clientSecret;
     public $generatedAccessToken;

     public $documents=[
        'documents'=>[
            'issuer'=>[]
        ] ];
     public function __construct()
     {
        $settings = Setting::get();
        $setting=[];
        foreach($settings as $resource){
            $setting[$resource->name]=$resource->value;
        }
       $this->apiBaseUrl= $setting['apiBaseUrl'];
       $this->idSrvBaseUrl= $setting['idSrvBaseUrl'];
       $this->clientId= $setting['clientId'];
       $this->clientSecret= $setting['clientSecret'];
   $this->documents['documents']['issuer']['address']['country']=$setting['address_country'];
   $this->documents['documents']['issuer']['address']['governate']=$setting['address_governate'];
   $this->documents['documents']['issuer']['address']['regionCity']=$setting['address_regionCity'];
   $this->documents['documents']['issuer']['address']['street']=$setting['address_street'];
   $this->documents['documents']['issuer']['address']['buildingNumber']=$setting['address_buildingNumber'];
   $this->documents['documents']['issuer']['address']['postalCode']=$setting['address_postalCode'];
   $this->documents['documents']['issuer']['address']['floor']=$setting['address_floor'];
   $this->documents['documents']['issuer']['address']['room']=$setting['address_room'];
   $this->documents['documents']['issuer']['address']['landmark']=$setting['address_landmark'];
   $this->documents['documents']['issuer']['address']['additionalInformation']=$setting['address_additionalInformation'];
   $this->documents['documents']['issuer']['type']=$setting['issuer_type'];
   $this->documents['documents']['issuer']['id']=$setting['issuer_id'];
   $this->documents['documents']['issuer']['name']=$setting['issuer_name'];
   
   $this->documents['documents']['documentTypeVersion']="0.9";
   $this->documents['documents']['dateTimeIssued']=Carbon::now()->format('Y-m-d\TH:i:s\Z');
   $this->documents['documents']['taxpayerActivityCode']=$setting['taxpayerActivityCode'];


   $this->documents['documents']['payment']['bankName']=$setting['payment_bankName'];
   $this->documents['documents']['payment']['bankAddress']=$setting['payment_bankAddress'];
   $this->documents['documents']['payment']['bankAccountNo']=$setting['payment_bankAccountNo'];
   $this->documents['documents']['payment']['bankAccountIBAN']=$setting['payment_bankAccountIBAN'];
   $this->documents['documents']['payment']['swiftCode']=$setting['payment_swiftCode'];
   $this->documents['documents']['payment']['terms']=$setting['payment_terms'];

   $this->documents['documents']['delivery']['approach']=$setting['delivery_approach'];
   $this->documents['documents']['delivery']['packaging']=$setting['delivery_packaging'];
   $this->documents['documents']['delivery']['dateValidity']=$setting['delivery_dateValidity'];
   $this->documents['documents']['delivery']['exportPort']=$setting['delivery_exportPort'];
   $this->documents['documents']['delivery']['grossWeight']=(Double) $setting['delivery_grossWeight'];
   $this->documents['documents']['delivery']['netWeight']=(Double) $setting['delivery_netWeight'];
   $this->documents['documents']['delivery']['terms']=$setting['delivery_terms'];



     }
    public function getDoc($url1){
     // die("test");
        $authorization = "Authorization: Bearer ".session('generatedAccessToken');


        $url= $this->apiBaseUrl.$url1;
      
        header('Content-Type: application/json'); // Specify the type of data
        $ch = curl_init($url); 
        curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_DIGEST);

        // Initialise cURL
      //  $post = json_encode($params); // Encode the data array into a JSON string
    
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json' , $authorization )); // Inject the token into the header
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
       // Specify the request method as POST
      
        curl_setopt( $ch, CURLOPT_CUSTOMREQUEST, 'GET' );

  
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); // This will follow any redirects
      
        $result = curl_exec($ch); // Execute the cURL statement
        curl_close($ch); 
      //  return $result;
      if(empty($result)){
     
        $params2['grant_type']='client_credentials';
        $params2['client_id']="44eb0d70-14ad-4643-88cb-dea997b0f15b";
        $params2["client_secret"]="8322a235-5b35-4091-8a5d-876113481e34";
        $params2["scope"]="InvoicingAPI";
       
        $url2='/connect/token';
        $data2= $this->post($url2,$params2);
  
        $data2=json_decode( $data2);
        $session = new Session();
        if($data2){
          $session->set('generatedAccessToken', $data2->access_token);
        }
      
        $this->getDoc($url1);
      }else{
        return json_decode($result);
      }
       
   }
    public  function post($url, $params){


        $url= $this->idSrvBaseUrl.$url;
   

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        curl_setopt($ch, CURLOPT_URL, $url);

        curl_setopt($ch, CURLOPT_POST, 1);

        // curl_setopt($ch, CURLOPT_HTTPHEADER, array(

        //     'Accept-Encoding: gzip,deflate',

        //     'Accept: application/json;charset=UTF-8',

        //     'Content-Type: application/json'

        //     ));

        curl_setopt($ch, CURLOPT_POSTFIELDS, $params);

        $response = curl_exec($ch);
       
        curl_close($ch);
        
        return $response;

    }

    public  function postDoc($url1, $params){
  
        $this->documents['documents']['documentType']='I';
        $this->documents['documents']['issuer']['address']['branchID']=(string) $params['branchID'];
        $this->documents['documents']['receiver']['address']['country']=$params['address_country'];
        $this->documents['documents']['receiver']['address']['governate']=$params['address_governate'];
        $this->documents['documents']['receiver']['address']['regionCity']=$params['address_regionCity'];
        $this->documents['documents']['receiver']['address']['street']=$params['address_street'];
        $this->documents['documents']['receiver']['address']['buildingNumber']=$params['address_buildingNumber'];
        $this->documents['documents']['receiver']['address']['postalCode']=$params['address_postalCode'];
        $this->documents['documents']['receiver']['address']['floor']=$params['address_floor'];
        $this->documents['documents']['receiver']['address']['room']=$params['address_room'];
        $this->documents['documents']['receiver']['address']['landmark']=$params['address_landmark'];
        $this->documents['documents']['receiver']['address']['additionalInformation']=$params['address_additionalInformation'];
        $this->documents['documents']['receiver']['type']=$params['receiver_type'];
        $this->documents['documents']['receiver']['id']=$params['receiver_id'];
        $this->documents['documents']['receiver']['name']=$params['receiver_name'];
        $this->documents['documents']['invoiceLines'] =$params['invoiceLines'];
        $this->documents['documents']['totalDiscountAmount'] =$params['totalDiscountAmount'];
        $this->documents['documents']['totalSalesAmount'] =$params['totalSalesAmount'];
        $this->documents['documents']['netAmount'] =$params['netAmount'];
        $this->documents['documents']['taxTotals'] =$params['taxTotals'];
        $this->documents['documents']['totalAmount'] =$params['totalAmount'];
        $this->documents['documents']['extraDiscountAmount'] =$params['extraDiscountAmount'];
        $this->documents['documents']['totalItemsDiscountAmount'] =$params['totalItemsDiscountAmount'];
        $this->documents['documents']['internalID'] =$params['internalID'];

        $this->documents['documents']['purchaseOrderReference']= "P-233-A6375";
        $this->documents['documents'][ "purchaseOrderDescription"]= "purchase Order description";

        $this->documents['documents'][ "salesOrderReference"]= "1231";

        $this->documents['documents'][ "salesOrderDescription"]= "Sales Order description";

        $this->documents['documents'][ "proformaInvoiceNumber"]= "SomeValue";




        $this->documents['documents']['taxTotals']=   $params["taxTotals"];
        $arraydata['documents'][]=$this->documents['documents'];
  
  //return $arraydata;
        $authorization = "Authorization: Bearer ".session('generatedAccessToken');


        $url= $this->apiBaseUrl.$url1;
        $fields = json_encode($arraydata);
        header('Content-Type: application/json'); // Specify the type of data
        $ch = curl_init($url); 
        curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_DIGEST);

        // Initialise cURL
      //  $post = json_encode($params); // Encode the data array into a JSON string
    
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json' , $authorization )); // Inject the token into the header
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, 1); // Specify the request method as POST
      // 
       curl_setopt($ch, CURLOPT_POSTFIELDS,$fields); // Set the posted fields
  
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); // This will follow any redirects
      
        $result = curl_exec($ch); // Execute the cURL statement
        curl_close($ch); // Close the cURL connection
 
    //    $curl_errno = curl_errno($ch);
    //    $curl_error = curl_error($ch);
    //    if (curl_errno($ch)) {
    //     $error = curl_error($ch);
    //     }
    //     die("ddd");
    //     if (isset($error)) {
    //         print_r($error);
    //        // echo $error;
    //         } else {
    //             print_r($result);
    //         }
    //   print_r($result);
    //    die;

    if(empty($result)){

      $params2['grant_type']='client_credentials';
      $params2['client_id']="44eb0d70-14ad-4643-88cb-dea997b0f15b";
      $params2["client_secret"]="8322a235-5b35-4091-8a5d-876113481e34";
      $params2["scope"]="InvoicingAPI";
     
      $url2='/connect/token';
      $data2= $this->post($url2,$params2);

      $data2=json_decode( $data2);
      $session = new Session();
      if($data2){
        $session->set('generatedAccessToken', $data2->access_token);
      }

      $this->postDoc($url1,$params);
    }else{
      return json_decode($result);
    }

   
      
    }


    public function Putinv($url1,$fields1){
    
      $authorization = "Authorization: Bearer ".session('generatedAccessToken');


      $url= $this->apiBaseUrl.$url1;
      $fields = json_encode($fields1);
      header('Content-Type: application/json'); // Specify the type of data
      $ch = curl_init($url); 
      curl_setopt($ch, CURLOPT_URL, $url);
      curl_setopt($ch, CURLOPT_PUT, true);
     
      curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_DIGEST);

      // Initialise cURL
    //  $post = json_encode($params); // Encode the data array into a JSON string
  
      curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json' , $authorization )); // Inject the token into the header
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
     // Specify the request method as POST
    
     curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);


      curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); // This will follow any redirects
    
      $result = curl_exec($ch); // Execute the cURL statement
      curl_close($ch); 

    //  return $result;
    if(empty($result)){
  
      $params2['grant_type']='client_credentials';
      $params2['client_id']="44eb0d70-14ad-4643-88cb-dea997b0f15b";
      $params2["client_secret"]="8322a235-5b35-4091-8a5d-876113481e34";
      $params2["scope"]="InvoicingAPI";
     
      $url2='/connect/token';
      $data2= $this->post($url2,$params2);

      $data2=json_decode( $data2);
      $session = new Session();
      if($data2){
        $session->set('generatedAccessToken', $data2->access_token);
      }
      // print_r($data2);die("test");
      // die("test");
      $this->Putinv($url1,$fields1);
    }else{
      //die("test");
      return json_decode($result);
    }
    }


}
