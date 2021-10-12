<div class="m-portlet__body">
    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="name">{!! trans('main.message') !!}</label>
            {!! Form::text('message',null,['class'=>'form-control
            m-input','id'=>'message','placeholder'=>trans('main.message')])!!}
        </div>


        <div class="col-lg-6">
            <label for="name">{!! trans('main.phones') !!}</label>
            {!! Form::select('phones[]',App\Models\ClientContact::get()->pluck('contact_info','contact_id'),null,['class'=>'form-control
            m-input select2','multiple','id'=>'phones'])!!}
        </div>

    </div>

</div>
@section('scripts')
<script type="text/javascript">


</script>
@endsection
