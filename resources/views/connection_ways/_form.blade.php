<div class="m-portlet__body">
    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="name_ar">{!! trans('main.name_ar') !!}</label>
            {!! Form::text('name_ar',null,['class'=>'form-control
            m-input','id'=>'name_ar','autocomplete'=>'off', 'placeholder'=>trans('main.name_ar')])!!}
        </div>
        <div class="col-lg-6">
            <label for="name_en">{!! trans('main.name_en') !!}</label>
            {!! Form::text('name_en',null,['class'=>'form-control
            m-input','id'=>'name_en', 'autocomplete'=>'off','placeholder'=>trans('main.name_en')])!!}
        </div>
    </div>

    <div class="form-group m-form__group row">
        <label>{!! trans('main.statuses') !!}</label>
        <table class="table table-striped- table-bordered dataTable table-hover table-checkable" id="tableData">
            <thead>
                <th>{{__('main.name_ar')}}</th>
                <th>{{__('main.name_en')}}</th>
                <th>{{__('main.delete')}}</th>
            </thead>
            <tbody>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3">
                        <button class="btn btn-success btn-sm" id="addTableRow">
                            <i class="fa fa-plus"></i>
                        </button>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>

</div>
@section('scripts')
<script type="text/javascript">
    @if (!empty($resource->statuses))
        @foreach($resource->statuses as $status)
            $('#tableData tbody').append(tableRow({!!$status !!}));
        @endforeach
    @endif
    
    $(document).on('click','#addTableRow',function(e){
        e.preventDefault();
        $('#tableData tbody').append(tableRow());
    });

    $(document).on('click','.deleteRecord',function (e){
        e.preventDefault();
        $(this).closest('tr').remove();

    });



    function tableRow(row = null){
        var name_ar = '';
        var name_en = '';
        
        if (row != null) {
            // console.log(row);
            name_ar = row.name_ar;
            name_en = row.name_en;
            
        }

        var rowHtml = '<tr>'
                        +'<td>'
                        +'<input  name="statuses[name_ar][]" type="text" class="form-control" value="'+name_ar+'">'
                        +'</td>'
                        +'<td>'
                        +'<input  name="statuses[name_en][]" type="text" class="form-control" value="'+name_en+'">'
                        +'</td>'
                        +'<td>'
                        +'<button class="btn btn-sm btn-danger deleteRecord"><i class="fa fa-trash"></i></button>'
                        +'</td>'
                    +'</tr>';
        return rowHtml;
    }


    
</script>
@endsection