<div class="m-portlet__body">
    <div class="form-group m-form__group row form_space">
        <div class="col-lg-4">
            <label for="name">{!! trans('main.title') !!}</label>
            {!! Form::text('title',null,['class'=>'form-control
            m-input','id'=>'title','placeholder'=>trans('main.title')])!!}
        </div>
        <div class="col-lg-4">
            <label for="name">{!! trans('main.page_id') !!}</label>
            {!! Form::text('page_id',null,['class'=>'form-control
            m-input','id'=>'page_id','placeholder'=>trans('main.page_id')])!!}
        </div>
        <div class="col-lg-4">
            <label for="name">{!! trans('main.post_id') !!}</label>
            {!! Form::text('post_id',null,['class'=>'form-control
            m-input','id'=>'post','placeholder'=>trans('main.post_id')])!!}
        </div>
        <div class="col-lg-12">
            <label for="name">{!! trans('main.details') !!}</label>
            {!! Form::textarea('details',null,['class'=>'form-control
            m-input','id'=>'details'])!!}
        </div>
    </div>
</div>
@section('scripts')
<script type="text/javascript">
 
    
</script>
@endsection