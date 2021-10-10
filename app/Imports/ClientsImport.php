<?php

namespace App\Imports;
use App\Models\Client;
use App\Models\ClientContact;
use App\Models\Responsable;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use App\Http\Requests\ClientRequest;
use Illuminate\Http\Request;

class ClientsImport implements ToModel, WithValidation, WithHeadingRow
{
    use Importable;

    public function model(array $row)
    {
        $resource = Client::create([
            'name'     => $row['name'],
            'email'    => $row['email'],
            'category_id'    => $row['category_id'],
            'marketing_way_id'    => $row['marketing_way_id'],
            'balance'    => $row['balance'],
            'job'    => $row['job'],
            'birth_date'    => $row['birth_date'],
            'address'    => $row['address'],
            'referred_by'    => $row['referred_by'],
            'notes'    => $row['notes'],
        ]);

      
        if (!empty($row['contacts'])) {
            $contacts=explode(',',$row['contacts']);
            for($i=0;$i<count($contacts);$i++){
                $contact['client_id'] = $resource->id ;
                $contact['phone']=$contacts[$i];
                ClientContact::create($contact);
                
            }

        }

        if (!empty($row['responsables'])) {
            $responsables=explode(',',$row['responsables']);
            for($i=0;$i<count($responsables);$i++){

                    Responsable::create([
                        'employee_id'=>$responsables[$i],
                        'model_id'=>$resource->id,
                        'model_type'=>'App\Models\Client'
                    ]);

            }

        }
    }


    public function rules(): array
    {
        return [
            'name' => 'required|string|max:191',
            'email' => 'required|email|max:191|unique:clients,email',
            'contacts.phones.*'=>'nullable|numeric|unique:client_contacts,phone',
            'responsables'=>'required',
            'category_id'=>'nullable|exists:client_categories,id',
            'marketing_way_id'=>'nullable|exists:marketing_ways,id',


     ];
    }
}