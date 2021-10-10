<div class="filter_section" style="display: none;">
    {!! Form::open(["route"=>$basicRoute.'.index','method'=>'GET',"id"=>"filterDataForm","class"=>"filterDataForm"])!!}
    {{--      order status--}}
    <div class="m-portlet__body">
        <div class="form-group m-form__group row">

            <div class="col-lg-2 col-md-3 col-sm-12 form_input">
                <label for="year">{!! trans('main.year') !!}</label>
                {!! Form::select('year',getyears(),2020,['class'=>'custom-select custom-select-sm form-control form-control-sm   ','id'=>'year'])!!}
            </div>
                       <div class="col-lg-4 col-md-3 col-sm-12 form_input">
                <label for="lead_status_id">{!! trans('main.items') !!}</label>
                {!! Form::select('item_id',App\Models\Item:: leftjoin('responsables as res', 'items.id', '=', 'res.model_id')
                    ->where(function($q){

                            if (Auth()->user() && !Auth()->user()->is_super_admin) {
           
                                $q->where('res.model_type', '=', "App\\Models\\Item")
                                ->where(function ($q) {
                                    $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                                    $q->where("res.employee_id", Auth()->user()->id);
                                    $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                                });
                            }
                    })
                    ->distinct()
                    ->select(["items.*"])
                    ->get()->

                pluck('name','id'),null,['class'=>'form-control
                m-input m-select2 select2','id'=>'item_id','placeholder'=>trans('main.items')])!!}
            </div>
            <div class="col-lg-2 col-md-3 col-sm-12 form_input"></div>
            <div class="col-sm-6 col-md-4 form_input d-flex justify-content-end">
                <a href="#" title="" id="clear" class="clear_btn base_btn">
                    <i class="la la-trash"></i>
                    <span>{{trans('main.clear')}}</span>
                </a>
            </div>


        </div>
    </div>
    {!!Form::close()!!}
</div>
