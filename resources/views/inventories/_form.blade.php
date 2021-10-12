<div class="m-portlet__body">
    <div class="form-group m-form__group row inventories_form">
        <div class="col-lg-4">
            <label for="name_ar">{!! trans('main.name_ar') !!}</label>
            {!! Form::text('name_ar',null,['class'=>'form-control
            m-input','id'=>'name_ar','placeholder'=>trans('main.name_ar')])!!}
        </div>
        <div class="col-lg-4">
            <label for="name_en">{!! trans('main.name_en') !!}</label>
            {!! Form::text('name_en',null,['class'=>'form-control
            m-input','id'=>'name_en','placeholder'=>trans('main.name_en')])!!}
        </div>

        <div class="col-lg-4">
            <label for="phone">{!! trans('main.phone') !!}</label>
            {!! Form::text('phone',null,['class'=>'form-control
            m-input','id'=>'phone','placeholder'=>trans('main.phone')])!!}
        </div>
        <div class="col-lg-6">
            <label for="address">{!! trans('main.address') !!}</label>
            {!! Form::textarea('address',null,['class'=>'form-control
            m-input','id'=>'address','placeholder'=>trans('main.address')])!!}
        </div>

        <div class="col-lg-6">
            <label for="notes">{!! trans('main.notes') !!}</label>
            {!! Form::textarea('notes',null,['class'=>'form-control
            m-input','id'=>'notes','placeholder'=>trans('main.notes')])!!}
        </div>
        <div class="col-lg-6">
            <label for="name">{!! trans('main.responsables') !!}</label>
            {!! Form::select('responsables[]',App\Models\User::
              where(function($q){
                         if(!Auth()->user()->is_super_admin){
                                $q->where("team_leader_id",Auth()->user()->id);
                                $q->orWhere("manager_id",Auth()->user()->id);
                                $q->orWhere("id",Auth()->user()->id);
                            }

                })
                ->get()->pluck('name','id'),$resource->responsables(),['class'=>'form-control

            m-input select2','multiple','id'=>'phones'])!!}
        </div>
    </div>
</div>
@section('scripts')
<script type="text/javascript">


</script>
@endsection
