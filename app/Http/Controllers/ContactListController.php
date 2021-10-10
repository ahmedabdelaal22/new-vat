<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\ClientContact;

use Illuminate\Http\Request;
use App\Http\Requests\ContactListRequest;
use View;
use DB;

class ContactListController extends CrudController
{

    public function __construct(Request $request)
    {

        $this->model = new ClientContact();
        $this->basicViewFolder = 'contact_list';
        $this->basicRoute = 'contact_list';
        $this->request = $request;

        $this->validationRequestClass = new ContactListRequest();

        parent::__construct();
    }

    public function edit($id){

        $resource = Client::findOrFail($id);

        if (view()->exists($this->basicViewFolder.'.edit')) {
            if (request()->ajax()) {
                return view($this->basicViewFolder.'.edit', compact('resource'))->render();
            }else{
                return view($this->basicViewFolder.'.edit', compact('resource'));
            }
        }

        return " the view ".$this->basicViewFolder.".edit not found";
    }

    public function store()
    {
        $this->runValidation();

        $contacts = $this->request->contacts;

        $data = $this->request->except('contacts');
        DB::beginTransaction();

        $resource = Client::create($data);
        // return $resource;

        if (!empty($this->request->contacts)) {
            foreach($this->request->contacts as $contact){
                $contact['client_id'] = $resource->id ;
                if (isset($contact['phone']) && !empty($contact['phone'])) {
                    $this->model::create($contact);
                }
            }

        }

        DB::commit();

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute.'.index');
    }

    public function update($id)
    {
        $this->runValidation();

        $contacts = $this->request->contacts;
        $data = $this->request->except('contacts');
        $resource = Client::findOrFail($id);
        // return $data;
        // return $this->request->contacts['phones'];
        DB::beginTransaction();

        $resource->update($data);

        $this->model::where('client_id',$resource->id)->delete();

        if (!empty($this->request->contacts)) {
            foreach($this->request->contacts as $contact){
                $contact['client_id'] = $resource->id ;

                if (isset($contact['phone']) && !empty($contact['phone'])) {
                    $this->model::create($contact);
                }
            }

        }

        DB::commit();

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute.'.index');
    }


    public function addPhones(){

        $validator = $this->validate($this->request,[
            'client_id'=>'required',
            'contacts'=>'required',
            'contacts.phones.*'=>'numeric|unique:client_contacts,phone'
        ]);

        if (!empty($this->request->contacts)) {
            foreach($this->request->contacts as $contact){
                $contact['client_id'] = $this->request->client_id ;
                if (isset($contact['phone']) && !empty($contact['phone'])) {
                    $oldPhone = ClientContact::where('client_id',$this->request->client_id)->where('phone',$contact['phone'])->first();
                    if ($oldPhone) {
                        $oldPhone->update($contact);
                    }else{
                        ClientContact::create($contact);
                    }
                }
            }

        }


        toastr()->success(trans('main.saved_successfully'));

        return redirect()->back();
    }


/* public function initial_responsables($resources)
    {
        if (Auth()->user() && !Auth()->user()->is_super_admin) {
            $resources = $resources->leftjoin('responsables as res', 'clients.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\Client")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->distinct()
                ->select(["clients.*"]);
        }

        return $resources;
    }*/
}
