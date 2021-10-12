<div class="filter_section" style="display: none;">
    {!! Form::open(["route"=>$basicRoute.'.index','method'=>'GET',"id"=>"filterDataForm","class"=>"filterDataForm"])!!}
    {{--      order status--}}
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

            <div class="col-sm-6 col-md-4 form_input">
                <label for="client_id">{!! trans('main.client') !!}</label>
                {!! Form::select('client_id',[],null,['class'=>'select2 select2_ajax custom-select custom-select-sm form-control form-control-sm   ','id'=>'client_id'])!!}
            </div>
            <div class="col-lg-4 col-md-3 col-sm-12 form_input">
                <label for="date">{!! trans('main.date') !!}</label>
                <div class="input-daterange input-group">
                    <input type="text" class="form-control form-control-sm date-picker" name="confirmed_start">
                    <div class="input-group-append">
                        <span class="span_to">{{trans('main.to')}}</span>
                    </div>
                    <input type="text" class="form-control form-control-sm date-picker" name="confirmed_end">
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 form_input">
                <label for="final_total">{!! trans('main.final_total') !!}</label>

                <div class="input-daterange input-group">
                    <input class="form-control form-control-sm" type="number" name="final_total_start">
                    <div class="input-group-append">
                        <span class="span_to">{{trans('main.to')}}</span>
                    </div>
                    <input class="form-control form-control-sm" type="number" name="final_total_end">
                </div>
            </div>
             <div class="col-lg-4 col-md-3 col-sm-12 form_input">
                <label for="name">{!! trans('main.responsables') !!}</label>
                {!! Form::select('responsables[]',App\Models\User::

                 where(function($q){
                 if(!Auth()->user()->is_super_admin){
                        $q->where("team_leader_id",Auth()->user()->id);
                        $q->orWhere("manager_id",Auth()->user()->id);
                        $q->orWhere("id",Auth()->user()->id);
                    }

                })->  
                get()->pluck('name','id'),null,['class'=>'form-control multi_select
                m-input select2','multiple','id'=>'responsables'])!!}
            </div>

            <div class="col-lg-4 col-md-3 col-sm-12 form_input">
                <label for="lead_status_id"> {!! trans('main.payment_type') !!}</label>
                {!! Form::select('payment_type',[""=>"",'cash'=>trans('main.cash'),'post_paid'=>trans('main.post_paid')],null,['class'=>'form-control
               m-input ','id'=>'payment_type'])!!}
            </div>
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
