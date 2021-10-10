<?php

namespace App\Imports;
use App\Models\Lead;
use App\Models\ClientContact;
use App\Models\Responsable;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use App\Http\Requests\ClientRequest;
use Illuminate\Http\Request;

class LeadsImport implements ToModel, WithValidation, WithHeadingRow
{
    use Importable;

    public function model(array $row)
    {
        $resource = Lead::create([
            'client_id'     => $row['client_id'],
            'marketing_way_id'    => $row['marketing_way_id'],
            'communicationMethod'    => $row['communicationmethod'],
            'campaignName'    => $row['campaignname'],
            'referred_by'    => $row['referred_by'],
            'lead_status_id'    => $row['lead_status_id'],
            'title'    => $row['title'],
            'details'    => $row['details'],
        ]);

        if (!empty($row['responsables'])) {
            $responsables=explode(',',$row['responsables']);
            for($i=0;$i<count($responsables);$i++){

                    Responsable::create([
                        'employee_id'=>$responsables[$i],
                        'model_id'=>$resource->id,
                        'model_type'=>'App\Models\Lead'
                    ]);

            }

        }
    }


    public function rules(): array
    {
        return [
            'responsables'=>'required',
            'client_id'=>'required|exists:clients,id',
            'lead_status_id'=>'required|exists:lead_statuses,id',
            'title'=>'required',
            'marketing_way_id'=>'nullable|exists:marketing_ways,id',
            'communicationmethod'=>'nullable|exists:communication_method,id',

            
     ];
    }
}