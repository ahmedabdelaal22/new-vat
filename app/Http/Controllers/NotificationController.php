<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Notification;
use Illuminate\Support\Facades\View;
use App\Models\NotificationUser;
use Lacuna\RestPki\CadesSignatureExplorer;
use Lacuna\RestPki\StandardSignaturePolicyCatalog;
class NotificationController extends Controller
{
    public function __construct()
    {

        $users = User::pluck('name', 'id');
        View::share('users', $users);
        view::share('basicRoute', 'notfications');
        view::share('basicViewFolder', 'notfications');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
   
      $path=  public_path('/listing1.json');
      
        $result = file_get_contents($path);
		$results = json_decode($result,true);


$amount=0;
$minesvalue=0;
$acountvalue=0;
foreach($results['documents'][0]['invoiceLines'][]['taxableItems']as $row){
  $amount+=$row['amount'];
  $minesvalue+=$row['amount']-$row['rate'];
  $acountvalue=$row['amount']+($row['rate']/100);
}
//return $results['documents'][0]['invoiceLines'][0]['taxableItems'] ;

echo $amount.'<br>';echo $minesvalue.'<br>';echo $acountvalue.'<br>';
die;

      $done= $this->Serialize($results);
      $hash =  hash('sha256', $done);
      $sigExplorer = new CadesSignatureExplorer("44eb0d70-14ad-4643-88cb-dea997b0f15b");
      $sigExplorer->acceptableExplicitPolicies = StandardSignaturePolicyCatalog::getPkiBrazilCades();
      $sigExplorer->securityContext = $hash ;
    //  $sigExplorer->setSignatureFileFromPath("app-data/{$hash}");
    $signature = $sigExplorer->open();
      dd($signature->signers);
        return $hash;
        die("test");

    }

  public  function  EscapeQuotes($stringValue){
    
    return str_replace('"\"', '"""', $stringValue);
    
  //  Replace($stringValue, """, "\"");
    }

    public function Serialize($documentStructure){
       
//         if documentStructure is simple value type
//         return """ + EscapeQuotes(documentStructure.value) + """
//     end if 
           if(is_scalar($documentStructure) ){
          //  dd($documentStructure);
            return '"' .$this->EscapeQuotes($documentStructure).'"';
           }
//     var serializedString = ""
    $serializedString = "";
//     foreach element in the structure:
        
//         serializeString.Append (""" + element.name.uppercase + """)
//         serializeString.Append ( Serialize(element.value) )

//     end foreach
         foreach($documentStructure as $element =>$value){
          //  dd($element);
             if(is_array($element) ){
               
                foreach ($element as $element =>$value) {
                
                    
                    $serializedString .='"' .strtoupper($element).'"';
                    $serializedString .=$this->Serialize($value);
                   
                }
                           
             
             }else{
          
                $serializedString .='"' .strtoupper($element).'"';
                $serializedString .=$this->Serialize($value);
             }
           
         }
    return $serializedString;
// end function


    }
    
 
}
