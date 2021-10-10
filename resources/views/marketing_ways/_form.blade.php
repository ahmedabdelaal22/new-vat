<div class="m-portlet__body">
    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="name_ar">{!! trans('main.name_ar') !!}</label>
            {!! Form::text('name_ar',null,['class'=>'form-control
            m-input','id'=>'name_ar','placeholder'=>trans('main.name_ar')])!!}
        </div>
        <div class="col-lg-6">
            <label for="name_en">{!! trans('main.name_en') !!}</label>
            {!! Form::text('name_en',null,['class'=>'form-control
            m-input','id'=>'name_en','placeholder'=>trans('main.name_en')])!!}
        </div>
    </div>
  

</div>
@section('scripts')
<script type="text/javascript">
    
    
</script>
@endsection