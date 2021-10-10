<div class="m-portlet__body">
    <div class="form-group m-form__group">
        <label for="exampleInputName">العنوان
        </label>
        {!! Form::text('basic_title',null,['class'=>'form-control
        m-input','id'=>'exampleInputName','placeholder'=>'العنوان'])!!}
    </div>

    <div class="form-group m-form__group">
        <label for="exampleInputName">التفاصيل</label>
        {!! Form::textarea('basic_body',null,['class'=>'form-control
        m-input ','id'=>'exampleInputName','rows'=>'5','placeholder'=>'التفاصيل '])!!}
    </div>
    
    <div class="form-group m-form__group">
        <label> المستلم </label>
        {!! Form::select('users[]',App\Models\User::get()->pluck('name','id'),null,['class'=>'form-control
            m-input select2','multiple','id'=>'users'])!!} 
             @if ($errors->has('users'))
        <span class="help-block">
            <strong>{{ $errors->first('users') }}</strong>
        </span>
        @endif
    </div>
</div>
@section('scripts')
<script type="text/javascript">

</script>
@endsection