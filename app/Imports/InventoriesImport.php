<?php

namespace App\Imports;
use App\Models\Inventory;
use App\Models\ClientContact;
use App\Models\Responsable;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use App\Http\Requests\ClientRequest;
use Illuminate\Http\Request;

class InventoriesImport implements ToModel, WithValidation, WithHeadingRow
{
    use Importable;

    public function model(array $row)
    {
        $resource = Inventory::create([
            'name_ar'     => $row['name_ar'],
            'name_en'    => $row['name_en'],
            'phone'    => $row['phone'],
            'address'    => $row['address'],
            'notes'    => $row['notes'],
        ]);

        if (!empty($row['responsables'])) {
            $responsables=explode(',',$row['responsables']);
            for($i=0;$i<count($responsables);$i++){

                    Responsable::create([
                        'employee_id'=>$responsables[$i],
                        'model_id'=>$resource->id,
                        'model_type'=>'App\Models\Inventory'
                    ]);

            }

        }
    }


    public function rules(): array
    {
        return [
            'responsables'=>'required',
            'name_ar'=>'required',
            'name_en'=>'required',
            'phone'=>'',
            'address'=>'',
            'notes'
     ];
    }
}