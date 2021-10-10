<?php

namespace App\Helper;
use Illuminate\Support\Facades\DB;

/**
 * @auther ahmed elshora
 */
class Helper {


	public static function getYoutubeId($url)
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


	public static  function getExcerpt($html)
	{
	    $text = strip_tags($html);
	    $excerpt = substr($text, 0, 15) . '...';
	    return $excerpt;
	}

	//Json array response
	public static function responseJson($status, $msg, $data = null)
	{
	    $response = [
	        'status' => (int)$status,
	        'message' => $msg,
	        'data' => $data,
	    ];
	    return response()->json($response);
	}


	public static function saveImage($file, $folder='/')
	{
	    $extension = $file->getClientOriginalExtension(); // getting image extension
	    $fileName = time() . '' . rand(11111, 99999) . '.' . $extension; // renameing image
	    $dest = public_path('/uploads'.$folder);
	    $file->move($dest, $fileName);
	    return '/uploads'.$folder . '/' . $fileName;
	}




	// one signal notification code
	public static  function oneSignalNotification($audience = ['included_segments' => ['All']], $contents = ['en' => ''], $data = [])
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


	// Firebase notification code

	public static function firebaseNotification($title, $body, $tokens, $type = 'STUDENT', $click_action = null, array $data = null)
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






}
