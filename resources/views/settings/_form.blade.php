<div class="m-portlet__body">
    <div class="form-group m-form__group row">
            @foreach($resources as $resource)
                <div class="form-group m-form__group col-lg-4">
                    @if($resource->option_type == 'textarea')
                        <label for="code">{!! trans('main.'.$resource->name) !!}</label>
                        <textarea name="{{$resource->name.'['.$resource->id.']'}}" class="form-control {{$resource->option}}">{{$resource->value}}</textarea>
                    @elseif($resource->option_type == 'checkbox' || $resource->option_type == 'radio')
                        <div class="checkbox primary">
                            <input type="{{$resource->option_type}}" name="{{$resource->name.'['.$resource->id.']'}}" {{($resource->value) ? 'checked' : ''}} class="form-control {{$resource->option}}" value="{{$resource->value}}" id="{{$resource->name.$resource->id}}">
                            <label for="{{$resource->name.$resource->id}}">{!! trans('main.'.$resource->name) !!}</label>
                        </div>
                        @elseif($resource->option_type == 'select' )
                        <div class="select primary">
                        <label for="{{$resource->name.$resource->id}}">{!! trans('main.'.$resource->name) !!}</label>
                        {!! Form::select("$resource->name[$resource->id]",settingselect($resource->name),$resource->value,['class'=>'form-control
                           m-input select2','autocomplete'=>'off','id'=>'parent_category'])!!}
              
                        </div>
                    @else
                        <label for="code">{!! trans('main.'.$resource->name) !!}</label>
                        <input type="{{$resource->option_type}}" name="{{$resource->name.'['.$resource->id.']'}}" class="form-control {{$resource->option}}" value="{{$resource->value}}">
                    @endif
                    
                </div>
            @endforeach
    </div>
</div>
@section('scripts')
<script type="text/javascript">


</script>
@endsection
