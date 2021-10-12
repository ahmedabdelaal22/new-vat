<?php

namespace App\Http\Controllers;
use App\Imports\ItemCategoriesImport;
use Illuminate\Http\Request;
use App\Models\ItemCategory;
use App\Models\Item;
use App\Http\Requests\ItemCategoryRequest;
use DB;

class ItemCategoryController extends CrudController
{
    public function __construct(Request $request)
    {

        $this->model = new ItemCategory();
        $this->import = new ItemCategoriesImport();
        $this->basicViewFolder = 'item_categories';
        $this->basicRoute = 'item_categories';
        $this->request = $request;
        
        $this->validationRequestClass = new ItemCategoryRequest();
        
        parent::__construct();
        
    }

    public function index(Request $request){
        // $this->model = $this->model::whereNull('parent_id');
        return parent::index($request);
    }

    public function store()
    {	

        $this->runValidation();

    	$data = $this->request->all();
    	
    	DB::beginTransaction();
        
        $resource = $this->model::create($data);
        
        if ($this->request->has('categories') && !empty($this->request->categories)) {
        	
        	$counter = 0;

        	foreach ($this->request->categories['name_ar'] as $key) {
        		 
        			$this->model::create([
        				'parent_id'=>$resource->id,
        				'name_ar'=>$this->request->categories['name_ar'][$counter],
                        'name_en'=>$this->request->categories['name_en'][$counter],
        				'notes'=>$this->request->categories['notes'][$counter]
        			]);
        	 

        		$counter++;
        	}
        }

        DB::commit();

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute.'.index');
    }


    public function update($id)
    {
        $this->runValidation();

        $data = $this->request->all();


       	DB::beginTransaction();
		        
        $resource = $this->model::findOrFail($id);
        
        $resource->update($data);

        $this->model::where('parent_id',$id)->delete();

        if ($this->request->has('categories') && !empty($this->request->categories)) {
        	
        	$counter = 0;

 
        	foreach ($this->request->categories["name_ar"] as $key) {
        		
        	 
        			$this->model::create([
                        'parent_id'=>$resource->id,
                        'name_ar'=>$this->request->categories['name_ar'][$counter],
                        'name_en'=>$this->request->categories['name_en'][$counter],
                        'notes'=>$this->request->categories['notes'][$counter]
                    ]);
        	 

        		$counter++;
        	}
        }

        DB::commit();

        toastr()->success(trans('main.saved_successfully'));

        return redirect()->route($this->basicRoute.'.index');
    }
    public function destroy($id)
    {
 
     
       $itemcount= Item::where('category_id',$id)->count();
       if($itemcount > 0 ){
        $response = [
	        'status' => (int)0,
	        'message' => trans('main.deleted_item_before_delted_category'),
	        'data' => [],
	    ];
        return response()->json($response);
       }else{
        return parent::destroy($id);
       }

    }

}
