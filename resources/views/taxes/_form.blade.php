<div class="m-portlet__body">
    <div class="form-group m-form__group row">

        <div class="col-lg-12">
            <label for="name">{!! trans('main.name') !!}</label>
            {!! Form::select('name',settingselect('TaxTypes'),null,['class'=>'form-control
            m-input select2','autocomplete'=>'off','id'=>'name'])!!}
        </div>
        <div class="col-lg-12">
            <label for="type">{!! trans('main.type') !!}</label>
            {!! Form::select('type',['percent'=>trans('main.percent').' % ','amount'=>trans('main.fixed_amount')],null,['class'=>'form-control
            m-input ','id'=>'type'])!!}
        </div>
        <div class="col-lg-12">
            <label for="value">{!! trans('main.value') !!}</label>
            {!! Form::text('value',null,['class'=>'form-control
            m-input','id'=>'value','placeholder'=>trans('main.value')])!!}
        </div>

    </div>
</div>
@section('scripts')
<script type="text/javascript">
 
    
</script>
@endsection