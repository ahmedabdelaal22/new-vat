<div class="filter_section" style="display: none;">
    {!! Form::open(["route"=>$basicRoute.'.index','method'=>'GET',"id"=>"filterDataForm","class"=>"filterDataForm"])!!}

    <div class="m-portlet__body">
        <div class="form-group m-form__group row">


            <div class="col-lg-4 col-md-3 col-sm-12 form_input">
                <div id="m_table_1_filter" class="dataTables_filter">
                    <label for="serach">{!! trans('main.search') !!}</label>
                    <input type="search" class="form-control form-control-sm  " placeholder="" id="serach"
                           name="search_query"
                           name="search_query"
                           aria-controls="m_table_1">
                </div>
            </div>

            <div class="col-sm-6 col-md-4 form_input"></div>
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
