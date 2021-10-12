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
            <label for="exampleInputName">{{trans('main.category')}}</label>
            {!! Form::select('category_id',App\Models\ClientCategory::get()->pluck('name','id'),null,['class'=>'form-control
            m-input m-select2 select2','id'=>'category_id','style'=>'width:100%','placeholder'=>trans('main.category')])!!}

        </div>

        <div class="col-lg-6">
            <label for="exampleInputName">{!! trans('main.marketing_way') !!}</label>
            {!! Form::select('marketing_way_id',App\Models\MarketingWay::get()->pluck('name','id'),null,['class'=>'form-control
            m-input m-select2 select2','id'=>'marketing_way_id','style'=>'width:100%','placeholder'=>trans('main.marketing_way')])!!}
        </div>
    </div>

    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="exampleInputName">{{trans('main.birth_date')}}</label>
            {!! Form::text('birth_date',null,['class'=>'form-control
            m-input date-picker','autocomplete'=>"off",'placeholder'=>trans('main.birth_date')])!!}
        </div>
        <div class="col-lg-6">
            <label for="exampleInputName">{!! trans('main.job') !!}</label>
            {!! Form::text('job',null,['class'=>'form-control
            m-input','id'=>'job','placeholder'=>trans('main.job')])!!}
        </div>
    </div>
    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="exampleInputName">{{trans('main.address')}}</label>
            {!! Form::text('address',null,['class'=>'form-control
            m-input','id'=>'address','placeholder'=>trans('main.address')])!!}
        </div>
        <div class="col-lg-6">
            <label for="exampleInputName">{!! trans('main.referred_by') !!}</label>
            {!! Form::text('referred_by',null,['class'=>'form-control
            m-input','id'=>'referred_by','placeholder'=>trans('main.referred_by')])!!}
        </div>
    </div>

    <div class="form-group m-form__group row">

        <div class="col-lg-12">
            <label for="notes">{!! trans('main.notes') !!}</label>
            {!! Form::textarea('notes',null,['class'=>'form-control
            m-input','id'=>'notes','placeholder'=>trans('main.notes')])!!}
        </div>
    </div>

    <div class="col-lg-12">
        <label for="name">{!! trans('main.responsables') !!}</label>
        {!! Form::select('responsables[]',App\Models\User::get()->pluck('name','id'),$resource->responsables(),['class'=>'form-control
        m-input select2','multiple','id'=>'phones'])!!}
    </div>

</div>

@include('clients._phones')
