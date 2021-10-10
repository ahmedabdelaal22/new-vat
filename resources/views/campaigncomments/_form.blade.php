<div class="m-portlet__body">
    <div class="form-group m-form__group row">
        <div class="col-lg-12">
            <label for="name">{!! trans('main.comment') !!}</label>
            {!! Form::text('comment',null,['class'=>'form-control
            m-input','id'=>'comment','placeholder'=>trans('main.comment')])!!}
        </div>
        <div class="col-lg-12">
            <label for="name">{!! trans('main.page') !!}</label>
            {!! Form::text('page_id',null,['class'=>'form-control
            m-input','id'=>'page_id','placeholder'=>trans('main.page')])!!}
        </div>
        <div class="col-lg-12">
            <label for="name">{!! trans('main.post') !!}</label>
            {!! Form::text('post_id',null,['class'=>'form-control
            m-input','id'=>'post','placeholder'=>trans('main.post')])!!}

        </div>
        <input type="hidden" name="campaign_id" value="{{$campaign_id}}">
    </div>
</div>
@section('scripts')
<script type="text/javascript">
 
    
</script>
@endsection