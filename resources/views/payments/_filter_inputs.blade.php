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
            <div class="col-lg-4 col-md-3 col-sm-12 form_input">
                <label for="date">{!! trans('main.date') !!}</label>
                <div class="input-daterange input-group">
                    <input type="text" class="form-control form-control-sm date-picker" name="date_start">
                    <div class="input-group-append">
                        <span class="span_to">{{trans('main.to')}}</span>
                    </div>
                    <input type="text" class="form-control form-control-sm date-picker" name="date_end">
                </div>
            </div>

            <div class="col-lg-4 col-md-3 col-sm-12 form_input">
                <label for="confirmed_at">{!! trans('main.confirmed_at') !!}</label>
                <div class="input-daterange input-group">
                    <input type="text" class="form-control form-control-sm date-picker" name="confirmed_at_start">
                    <div class="input-group-append">
                        <span class="span_to">{{trans('main.to')}}</span>
                    </div>
                    <input type="text" class="form-control form-control-sm date-picker" name="confirmed_at_end">
                </div>
            </div>


            <div class="col-lg-4 col-md-4 col-sm-12 form_input">
                <label for="amount">{!! trans('main.amount') !!}</label>

                <div class="input-daterange input-group">
                    <input class="form-control form-control-sm" type="number" name="amount_start">
                    <div class="input-group-append">
                        <span class="span_to">{{trans('main.to')}}</span>
                    </div>
                    <input class="form-control form-control-sm" type="number" name="amount_end">
                </div>
            </div>


            <div class="col-sm-6 col-md-4 form_input">
                <label for="supplier_id">{!! trans('main.supplier') !!}</label>
                {!! Form::select('supplier_id',[],null,['class'=>'select2 select2_ajax custom-select custom-select-sm form-control form-control-sm   ','id'=>'supplier_id'])!!}
            </div>


            <div class="col-sm-6 col-md-4 form_input">
                <label for="inventory_id">{!! trans('main.created_by') !!}</label>
                {!! Form::select('created_by',[],null,['class'=>'select2 select2_ajax custom-select custom-select-sm form-control form-control-sm   ','id'=>'created_by'])!!}
            </div>

            <div class="col-sm-6 col-md-4 form_input">
                <label for="inventory_id">{!! trans('main.confirmed_by') !!}</label>
                {!! Form::select('confirmed_by',[],null,['class'=>'select2 select2_ajax custom-select custom-select-sm form-control form-control-sm   ','id'=>'confirmed_by'])!!}
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
