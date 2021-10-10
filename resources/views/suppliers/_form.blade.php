<div class="m-portlet__body">
    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="name">{!! trans('main.name') !!}</label>
            {!! Form::text('name',null,['class'=>'form-control
            m-input','id'=>'name','placeholder'=>trans('main.name')])!!}
        </div>

        <div class="col-lg-6">
            <label for="email">{!! trans('main.email') !!}</label>
            {!! Form::text('email',null,['class'=>'form-control
            m-input','id'=>'email','placeholder'=>trans('main.email')])!!}
        </div>

    </div>

    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="phone">{!! trans('main.phone') !!}</label>
            {!! Form::text('phone',null,['class'=>'form-control
            m-input','id'=>'phone','placeholder'=>trans('main.phone')])!!}
        </div>

        <div class="col-lg-6">
            <label for="initial_balance">{!! trans('main.initial_balance') !!}</label>
            {!! Form::text('initial_balance',null,['class'=>'form-control
            m-input','id'=>'initial_balance','placeholder'=>trans('main.initial_balance')])!!}
        </div>

    </div>

    <div class="col-lg-12">
        <label for="name">{!! trans('main.responsables') !!}</label>
        {!! Form::select('responsables[]',App\Models\User::
                     where(function($q){
                     if(!Auth()->user()->is_super_admin){
                            $q->where("team_leader_id",Auth()->user()->id);
                            $q->orWhere("manager_id",Auth()->user()->id);
                            $q->orWhere("id",Auth()->user()->id);
                        }

            })->

        get()->pluck('name','id'),$resource->responsables(),['class'=>'form-control
        m-input select2','multiple','id'=>'phones'])!!}
    </div>

    <div class="form-group m-form__group row">
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
    </div>


</div>
@section('scripts')
<script type="text/javascript">


</script>
@endsection
