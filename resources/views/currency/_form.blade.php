<div class="m-portlet__body">
    <div class="form-group m-form__group row">

        <div class="col-lg-12">
            <label for="type">{!! trans('main.name') !!}</label>
            {!! Form::text('name',null,['class'=>'form-control
            m-input','id'=>'name','placeholder'=>trans('main.name')])!!}
        </div>
        <div class="col-lg-12">
            <label for="value">{!! trans('main.code') !!}</label>
            {!! Form::text('code',null,['class'=>'form-control
            m-input','id'=>'code','placeholder'=>trans('main.code')])!!}
        </div>
        <div class="col-lg-12">
            <label for="value">{!! trans('main.symbol') !!}</label>
            {!! Form::text('symbol',null,['class'=>'form-control
            m-input','id'=>'symbol','placeholder'=>trans('main.symbol')])!!}
        </div>
        <div class="col-lg-12">
            <label for="value">{!! trans('main.amount') !!}</label>
            {!! Form::text('amount',null,['class'=>'form-control
            m-input','id'=>'amount','placeholder'=>trans('main.amount')])!!}
        </div>
    </div>
</div>
@section('scripts')
<script type="text/javascript">
 
    
</script>
@endsection