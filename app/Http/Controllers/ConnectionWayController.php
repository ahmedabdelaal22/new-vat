<?php

namespace App\Http\Controllers;

use App\Models\ConnectionWay;
use App\Models\ConnectionWayStatus;
use Illuminate\Http\Request;
use App\Http\Requests\ConnectionWayRequest;
use View;
use DB;

class ConnectionWayController extends CrudController
{

    public function __construct(Request $request)
    {

        $this->model = new ConnectionWay();
        $this->basicViewFolder = 'connection_ways';
        $this->basicRoute = 'connection_ways';
        $this->request = $request;

        $this->validationRequestClass = new ConnectionWayRequest();
        
        parent::__construct();
    }

    public function connection_way_status(Request $request)
    {

        $connectionWay = ConnectionWay::where('id', '=', $request->connection_way_id)->first();

        foreach ($connectionWay->statuses()->get() as $status) {
         
            $connection_status[] = [
                'id' => $status->id,
                'name' => $status->name
            ];
        }

        $data = [
            'connection_status' => $connection_status,
        ];

        return response($data, 200)->header('Content-Type', 'text/plain');
    }

    public function store(){

        $this->runValidation();

        $connectionWay = $this->model::create($this->request->except('statuses'));
        
        if ($this->request->has('statuses') && !empty($this->request->statuses)) {
            
            $counter = 0 ;
            
            foreach ($this->request->statuses['name_ar'] as $value) {
                
                $statusData = [
                    'connection_way_id'=>$connectionWay->id,
                    'name_ar'=>isset($this->request->statuses['name_ar'][$counter]) ? $this->request->statuses['name_ar'][$counter] : '',
                    'name_en'=>isset($this->request->statuses['name_en'][$counter]) ? $this->request->statuses['name_en'][$counter] : '',
                ];
                ConnectionWayStatus::create($statusData);
                $counter++;
            }
        }
        

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');

    }


    public function update($id){

        $this->runValidation();
        
        $connectionWay = $this->model::findOrFail($id);

        $connectionWay->update($this->request->except('statuses'));
        
        ConnectionWayStatus::where('connection_way_id',$id)->delete();

        if ($this->request->has('statuses') && !empty($this->request->statuses)) {
            
            $counter = 0 ;
            
            foreach ($this->request->statuses['name_ar'] as $value) {
                
                $statusData = [
                    'connection_way_id'=>$connectionWay->id,
                    'name_ar'=>isset($this->request->statuses['name_ar'][$counter]) ? $this->request->statuses['name_ar'][$counter] : '',
                    'name_en'=>isset($this->request->statuses['name_en'][$counter]) ? $this->request->statuses['name_en'][$counter] : '',
                ];
 
                ConnectionWayStatus::create($statusData);
                $counter++;
            }
        }
      
 
 

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');

    }

}
