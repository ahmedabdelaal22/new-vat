<div class="filter_section" style="display: none;">
    {!! Form::open(["route"=>$basicRoute.'.index','method'=>'GET',"id"=>"filterDataForm","class"=>"filterDataForm"])!!}

    <div class="m-portlet__body">
        <div class="form-group m-form__group row">
            <div class="col-lg-4 col-md-3 col-sm-12 form_input">
                <div id="m_table_1_filter" class="dataTables_filter">
                    <label for="serach">{!! trans('main.search') !!}</label>
                    <input type="search" class="form-control form-control-sm  " placeholder="" id="serach"
                           name="search_query" aria-controls="m_table_1">
                </div>
            </div>

            <div class="col-sm-6 col-md-4 form_input">
                <label for="employee_id">{!! trans('main.employee') !!}</label>
                {!! Form::select('employee_id',[],null,['class'=>'select2 select2_ajax custom-select custom-select-sm form-control form-control-sm   ','id'=>'employee_id'])!!}
            </div>

            <div class="col-sm-6 col-md-4 form_input">
                <label for="auditable_type">{!! trans('main.module') !!}</label>
                {!! Form::select('auditable_type',array_merge(array(""=>trans("main.select_value")),array_unique(App\Models\Log::get()->pluck('type','type')->toArray())),null,['class'=>'select2  custom-select custom-select-sm form-control form-control-sm   ','id'=>'auditable_type'])!!}
            </div>

            <div class="col-sm-6 col-md-4 form_input">
                <label for="event">{!! trans('main.event') !!}</label>
                {!! Form::select('event',[""=>trans("main.select_value"),
                        'created'=>trans("main.created"),'updated'=>trans("main.updated"),
                        'deleted'=>trans("main.deleted"),'restored'=>trans("main.restored"),
                     ],null,['class'=>'select2  custom-select custom-select-sm form-control form-control-sm   ','id'=>'event'])!!}
            </div>

            <div class="col-sm-6 col-md-4"></div>
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
