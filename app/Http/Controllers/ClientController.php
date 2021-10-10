<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\ClientContact;
use App\Imports\ClientsImport;
use App\Models\CollectionItem;
use App\Models\Responsable;
use App\Models\SmsMessagePhone;
use Illuminate\Http\Request;
use App\Http\Requests\ClientRequest;
use View;
use DB;

class ClientController extends CrudController
{

    public function __construct(Request $request)
    {

        $this->model = new Client();
        $this->import = new ClientsImport();
        $this->basicViewFolder = 'clients';
        $this->basicRoute = 'clients';
        $this->request = $request;

        $this->validationRequestClass = new ClientRequest();

        parent::__construct();
    }

    public function store()
    {
      
        $this->runValidation();

        $contacts = $this->request->contacts;
        $data = $this->request->except('contacts');

        DB::beginTransaction();

        $resource = $this->model::create($data);

        if (!empty($contacts)) {
            foreach ($contacts as $contact) {
                $contact['client_id'] = $resource->id;
                if (isset($contact['phone']) && !empty($contact['phone'])) {
                    ClientContact::create($contact);
                }
            }

        }


        // save responsables
        Responsable::where('model_type', 'App\Models\Client')->where("model_id", $resource->id)->delete();
        if (!empty($this->request->responsables)) {
            foreach ($this->request->responsables as $responsable) {

                Responsable::create([
                    'employee_id' => $responsable,
                    'model_id' => $resource->id,
                    'model_type' => 'App\Models\Client'
                ]); 
            } 
        }


        DB::commit();

        toastr()->success(trans('main.saved_successfully'));
        if ($this->request->has('redirect_back_after_create') && !empty($this->request->redirect_back_after_create) && $this->request->redirect_back_after_create == 1) {
            return redirect()->back();

        }
        return redirect()->route($this->basicRoute . '.index');
    }

    public function update($id)
    {
       
        $this->runValidation();
        // return $this->request->all();

        // dd("ccc");
        $contacts = $this->request->contacts;
        $data = $this->request->except('contacts');
        $resource = $this->model::findOrFail($id);
        // return $this->request->contacts['phones'];
        DB::beginTransaction();

        $resource->update($data);
        ClientContact::where('client_id', $resource->id)->delete();
        // $counter = 0;
        if (!empty($contacts)) {
            foreach ($contacts as $contact) {
                $contact['client_id'] = $resource->id;
                if (isset($contact['phone']) && !empty($contact['phone'])) {
                    ClientContact::create($contact);
                }
            }

        }


        // save responsables
        Responsable::where('model_type', 'App\Models\Client')->where("model_id", $resource->id)->delete();
        if (!empty($this->request->responsables)) {
            foreach ($this->request->responsables as $responsable) {

                Responsable::create([
                    'employee_id' => $responsable,
                    'model_id' => $resource->id,
                    'model_type' => 'App\Models\Client'
                ]);

            }
        }

        DB::commit();

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.index');
    }

    public function update_show($id)
    {
        $validationRequest = new ClientRequest();
        $this->storeRules = $this->updateRules = $validationRequest->rules($id);
        $validator = $this->validate($this->request, $this->updateRules, $this->rulesMessages);
        $contacts = $this->request->contacts;
        $data = $this->request->except('contacts');
        $resource = $this->model::findOrFail($id);
        // return $this->request->contacts['phones'];
        DB::beginTransaction();

        $resource->update($data);


        DB::commit();

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute . '.show', $id);
    }

    public function updatePhones()
    {

        $validator = $this->validate($this->request, [
            'client_id' => 'required',
            'contacts' => 'required',
            'contacts.phones.*' => 'numeric|unique:client_contacts,phone'
        ]);

        ClientContact::where('client_id', $this->request->client_id)->delete();

        if (!empty($this->request->contacts)) {
            foreach ($this->request->contacts as $contact) {
                $contact['client_id'] = $this->request->client_id;
                if (isset($contact['phone']) && !empty($contact['phone'])) {
                    $oldPhone = ClientContact::where('client_id', $this->request->client_id)->where('phone', $contact['phone'])->first();
                    if ($oldPhone) {
                        $oldPhone->update($contact);
                    } else {
                        ClientContact::create($contact);
                    }
                }
            }

        }


        toastr()->success(trans('main.saved_successfully'));

        return redirect()->back();
    }

    public function initial_responsables($resources)
    {
        if (Auth()->user() && !Auth()->user()->is_super_admin) {
            $resources = $resources->leftjoin('responsables as res', 'clients.id', '=', 'res.model_id')
                ->where('res.model_type', '=', "App\\Models\\Client")
                ->where(function ($q) {
                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                    $q->where("res.employee_id", Auth()->user()->id);
                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                })
                ->groupby("clients.id")
                ->select(["clients.*"]);
        }

        return $resources;
    }

    public function destroy($id)
    {
        ClientContact::where('client_id', $id)->delete();
        Responsable::where('model_type', 'App\Models\Client')->where("model_id", $id)->delete();
        return parent::destroy($id);
    }

}
