<div class="m-portlet__body">
    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="name">{!! trans('main.name') !!}</label>
            {!! Form::text('name',null,['class'=>'form-control
            m-input','id'=>'name','placeholder'=>trans('main.name')])!!}
        </div>

        <div class="col-lg-6">
            <label for="phone">{!! trans('main.phone') !!}</label>
            {!! Form::text('phone',null,['class'=>'form-control
            m-input','id'=>'phone','placeholder'=>trans('main.phone')])!!}
        </div>

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