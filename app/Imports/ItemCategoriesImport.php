<?php

namespace App\Imports;
use App\Models\ItemCategory;
use App\Models\ClientContact;
use App\Models\Responsable;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use App\Http\Requests\ClientRequest;
use Illuminate\Http\Request;

class ItemCategoriesImport implements ToModel, WithValidation, WithHeadingRow
{
    use Importable;

    public function model(array $row)
    {
        $resource = ItemCategory::create([
            'parent_id'     => $row['parent_id'],
            'name_en'    => $row['name_en'],
            'name_ar'    => $row['name_ar'],
            'notes'    => $row['notes'],
        ]);

    }


    public function rules(): array
    {
        return [
            'name_ar'=>'required',
            'name_en'=>'required',
            'parent_id'=>'nullable|exists:item_categories,id',

     ];
    }
}