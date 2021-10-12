<?php

use Illuminate\Support\Facades\Http;

function notifications()
{
    $user = Auth()->user();
    return $user->notifications()->without('user')->latest()->paginate(30);
}


function notifications_count()
{
    $user = Auth()->user();
    return count($user->notifications);
}


function settingselect($name)
{
    //dd($name);
    if($name == 'taxpayerActivityCode'){
		$path=  public_path('/ActivityCodes.json');
      
        $activecodes = file_get_contents($path);
		$activecodes1 = json_decode($activecodes,true);
	    $activecodes  =[];
		foreach($activecodes1 as $row){
	  if (App()->getLocale() == 'en') {
        	$activecodes[$row['code']]=$row['Desc_en'];

        }else{
			$activecodes[$row['code']]=$row['Desc_ar'];
		}
		}
        return $activecodes;
    }
    elseif($name == 'address_country' ){
        
		$path=  public_path('/CountryCodes.json');
      
        $activecodes = file_get_contents($path);
		$activecodes1 = json_decode($activecodes,true);
      //  dd($activecodes1);
	    $activecodes  =[];
		foreach($activecodes1 as $row){
            if(!empty($row['code'])){
                if (App()->getLocale() == 'en') {
                    $activecodes[$row['code']]=$row['Desc_en'];
        
                }else{
                    $activecodes[$row['code']]=$row['Desc_ar'];
                }
                }
            }
         

        return $activecodes;
    }
    elseif($name == 'TaxTypes' ){
      
		$path=  public_path('/TaxTypes.json');
      
        $activecodes = file_get_contents($path);
		$activecodes1 = json_decode($activecodes,true);
         //dd($activecodes1);
	    $activecodes  =[];
		foreach($activecodes1 as $row){
            if(!empty($row['Code'])){
                if (App()->getLocale() == 'en') {
                    $activecodes[$row['Code']]=$row['Desc_en'];
        
                }else{
                    $activecodes[$row['Code']]=$row['Desc_ar'];
                }
                }
            }
         
       //dd($activecodes);
        return $activecodes;
    }
    elseif($name == 'unitType' ){
      
		$path=  public_path('/UnitTypes.json');
      
        $activecodes = file_get_contents($path);
		$activecodes1 = json_decode($activecodes,true);
         //dd($activecodes1);
	    $activecodes  =[];
		foreach($activecodes1 as $row){
            if(!empty($row['code'])){
                $activecodes[$row['code']]=$row['desc_en'];
                }
            }
         
       //dd($activecodes);
        return $activecodes;
    }
    //unitType
    
}
function itemtaxes(){
    $path=  public_path('/TaxTypes.json');
      
    $activecodes = file_get_contents($path);
    $activecodes1 = json_decode($activecodes,true);
     //dd($activecodes1);
    $activecodes  =[];
    foreach($activecodes1 as $row){
        if(!empty($row['Code'])){
            if (App()->getLocale() == 'en') {
                $activecodes[$row['Code']]=$row['Desc_en'];
    
            }else{
                $activecodes[$row['Code']]=$row['Desc_ar'];
            }
            }
        }
     $taxes=[];
    $itemtaxes=App\Models\Tax::get();
    foreach($itemtaxes as $row){
        $taxes[$row->id]=$activecodes[$row->name];


    }
    return  $taxes;

}
function gettaxe($key){
    $path=  public_path('/TaxTypes.json');
      
    $activecodes = file_get_contents($path);
    $activecodes1 = json_decode($activecodes,true);
     //dd($activecodes1);
    $activecodes  =[];
    foreach($activecodes1 as $row){
        if(!empty($row['Code'])){
            if (App()->getLocale() == 'en') {
                $activecodes[$row['Code']]=$row['Desc_en'];
    
            }else{
                $activecodes[$row['Code']]=$row['Desc_ar'];
            }
            }
        }

    return  $activecodes[$key] ;

}

function extensions(){
    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);
    $operatin=App\Models\LeadOperation::orderByRaw("operation_date DESC, operation_time ASC")
    ->where("user_id", Auth()->user()->id)
    ->orWhereIn("user_id", json_decode(json_encode($query_result), true))->distinct()
    ->paginate(30);
    return $operatin;
}

function getYoutubeId($url)
{
    /*
     Here is a sample of the URLs this regex matches: (there can be more content after the given URL that will be ignored)
     http://youtu.be/dQw4w9WgXcQ
     http://www.youtube.com/embed/dQw4w9WgXcQ
     http://www.youtube.com/watch?v=dQw4w9WgXcQ
     http://www.youtube.com/?v=dQw4w9WgXcQ
     http://www.youtube.com/v/dQw4w9WgXcQ
     http://www.youtube.com/e/dQw4w9WgXcQ
     http://www.youtube.com/user/username#p/u/11/dQw4w9WgXcQ
     http://www.youtube.com/sandalsResorts#p/c/54B8C800269D7C1B/0/dQw4w9WgXcQ
     http://www.youtube.com/watch?feature=player_embedded&v=dQw4w9WgXcQ
     http://www.youtube.com/?feature=player_embedded&v=dQw4w9WgXcQ
     It also works on the youtube-nocookie.com URL with the same above options.
     It will also pull the ID from the URL in an embed code (both iframe and object tags)
    */
    preg_match('%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i', $url, $match);
    if (isset($match[1])) {
        return $match[1];
    }
    return "";
}

function getExcerpt($html)
{
    $text = strip_tags($html);
    $excerpt = substr($text, 0, 15) . '...';
    return $excerpt;
}

//Json array response
function responseJson($status, $msg, $data = null)
{
    $response = [
        'status' => (int)$status,
        'message' => $msg,
        'data' => $data,
    ];
    return response()->json($response);
}

function saveImage($file, $folder = '/')
{
    $extension = $file->getClientOriginalExtension(); // getting image extension
    $fileName = time() . '' . rand(11111, 99999) . '.' . $extension; // renameing image
    $dest = public_path('/uploads' . $folder);
    $file->move($dest, $fileName);
    return '/uploads' . $folder . '/' . $fileName;
}

// one signal notification code
function oneSignalNotification($audience = ['included_segments' => ['All']], $contents = ['en' => ''], $data = [])
{
    // audience include_player_ids
    $appId = ['app_id' => env('ONE_SIGNAL_APP_ID')];

    $fields = json_encode((array)$appId + (array)$audience + ['contents' => (array)$contents] + ['data' => (array)$data] + ['ios_badgeType' => 'Increase', 'ios_badgeCount' => 1] + ['headings' => ['en' => 'Mswrati مصوراتي']]);
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, 'https://onesignal.com/api/v1/notifications');
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json; charset=utf-8',
        'Authorization: Basic ' . env('ONE_SIGNAL_KEY')]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    curl_close($ch);

    return $response;
}

function all_way_status($connection_way_id = null)
{


    if ($connection_way_id == null) {
        return [];
    }

    $connectionWay = App\Models\ConnectionWay::where('id', '=', $connection_way_id)->first();

    $connection_status = [];

    if (!empty($connectionWay->statuses)) {
       $connection_status = $connectionWay->statuses()->get()->pluck('name','id')->toArray();
    }

// dd($connection_status);
    return $connection_status;
}


function all_collection_items($collection_id = null)
{
    if ($collection_id == null) {
        return [];
    }
    $collection = App\Models\CollectionItem::where('collection_id', '=', $collection_id)->get();
    $connection_status = array();
    foreach($collection as $row){
        $connection_status[]=$row->model_id;
    }

    return $connection_status;
}


function all_purchase_invoices($payment_id = null)
{
    if ($payment_id == null) {
        return [];
    }
    $collection = App\Models\PaymentItem::where('payment_id', '=', $payment_id)->get();
    $connection_status = array();
    foreach($collection as $row){
        $connection_status[]=$row->model_id;
    }

    return $connection_status;
}
function get_salseinvoice($client_id = null)
{
    if ($client_id == null) {
        return [];
    }
    return  App\Models\SalesInvoice::where('client_id',$client_id)->get()->pluck('code','id');

}

function get_purchase_invoices($supplier_id = null)
{
    if ($supplier_id == null) {
        return [];
    }
    return  App\Models\PurchaseInvoice::where('supplier_id',$supplier_id)->get()->pluck('code','id');

}


// Firebase notification code

function firebaseNotification($title, $body, $tokens, $type = 'STUDENT', $click_action = null, array $data = null)
{
    // https://gist.github.com/rolinger/d6500d65128db95f004041c2b636753a

    $registrationIDs = $tokens;
    $fcmMsg = [
        'body' => $body,
        'title' => $title,
        'click_action' => $click_action,
        // 'sound' => "default",
        // 'color' => "#203E78"
    ];
    $fcmFields = [
        'registration_ids' => $registrationIDs,
        'priority' => 'high',
        'notification' => $fcmMsg,
        'data' => $data,
    ];
    $headers = [
        'Authorization: key=' . env("FIREBASE_{$type}_KEY"),
        'Content-Type: application/json',
    ];


    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmFields));
    $result = curl_exec($ch);
    curl_close($ch);
    return $result;
}

function logsnave()
{

    $resources = DB::table('audits')->where('user_id', Auth()->guard('web')->user()->id)->where("auditable_type","!=","App\Models\Permission")->latest()->limit(20)->get();
    return $resources;
    //  return 1;
}

function keyvalueaction($auditable_type, $model_action)
{
    $arraykey = array();
    $arraykey[$auditable_type . "\\" . $model_action] = "";

    $model_name = "";
    if ($auditable_type) {
        $model_name = explode("\\", $auditable_type)[2];
        $arraykey[$auditable_type . "\\" . $model_action] =
            trans("main.$model_action") . "" . trans("main.on_model") . "" . trans("main.$model_name") . "";
    }


    return $arraykey[$auditable_type . "\\" . $model_action];
}

function showLoghelper($auditable_type, $event)
{
    return keyvalueaction($auditable_type, $event);
}
function getReportDatesArray($year)
{
    $dates_array = ["$year-01-01", "$year-02-01", "$year-03-01", "$year-04-01",
    "$year-05-01", "$year-06-01", "$year-07-01", "$year-08-01",
    "$year-09-01", "$year-10-01", "$year-11-01", "$year-12-01"
    ];

    return $dates_array;
}
function getYears()
{
    $years = ["2020"=>"2020","2021"=>"2021","2022"=>"2022","2023"=>"2023","2024"=>"2024","2025"=>"2025"
    ,"2026"=>"2026","2027"=>"2027","2028"=>"2028","2029"=>"2029","2030"=>"2030"];

    return $years;
}
function get_arabic_month($key)
{
    $months=["January" => "يناير", "February" => "فبراير", "March" => "مارس", "April" => "أبريل", "May" => "مايو", "June" => "يونيو", "July" => "يوليو", "August" => "أغسطس", "September" => "سبتمبر", "October" => "أكتوبر", "November" => "نوفمبر", "December" => "ديسمبر"];

    return $months[$key];
}

function showLog($url, $request)
{
    $arrays_url['api/v1/users'] = '';
    $arrays_url['api/v1/task_view'] = '';
    $arrays_url['api/v1/task_comments'] = '';
    $arrays_url['api/v1/task_list'] = '';
    $arrays_url['api/v1/get_decision_pdf'] = '';
    $arrays_url['api/v1/polls'] = '';
    $arrays_url['api/v1/polls'] = '';
    $function = str_replace("/", "_", $url);

    return call_user_func($function, $request);
    // return "$function".($request);
    //return $arrays_url[$url];
}


function showGetUrlHelper($url, $auditable_type, $auditable_id)
{

    // check model record
    $first_model_record = $auditable_type::where('id', $auditable_id)->first();

    if ((isset($first_model_record->status) and $first_model_record->status == "1")
        || (isset($first_model_record) and !isset($first_model_record->status))) {

        if (routeMatchingUrl($url))
            return url($url);

    }
}

function routeMatchingUrl($url)
{


    $response = Http::get($url);

    if ($response->successful()) {
        // route exists
        return true;
    } else {
        // route doesn't exist
        return false;

    }


    /*    $routes = \Illuminate\Support\Facades\Route::getRoutes();
        $request = \Illuminate\Support\Facades\Request::create($url);
        try {
            $routes->match($request);
            // route exists
            return true;
        } catch (\Symfony\Component\HttpKernel\Exception\NotFoundHttpException $e) {
            // route doesn't exist
            return false;
        }*/
}
