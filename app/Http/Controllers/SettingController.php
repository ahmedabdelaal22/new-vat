<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Setting;

class SettingController extends Controller
{
    public function index(){

//	return $activecodes;
    	$resources = Setting::get();


    	return view('settings.edit',compact('resources'));
    }


    public function store(Request $request){
// 		return $request->all();
// dd("test");
    	foreach ($request->except('_token') as $key => $value) {

			foreach($value as $id => $recordValue){
				
				$record = Setting::where('id',$id)->first();

				if ($record) {
					if ($record->option_type == 'file') {
						if ($request->hasFile($key)) {
                            $record->update(['value'=>saveImage($recordValue, '/')]);
                        }
					}else{
						$record->update(['value'=>$recordValue]);
					}
				}
			}
    	}
        

        return redirect()->back();

    }
}
