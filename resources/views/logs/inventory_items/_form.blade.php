<div class="m-portlet__body">
    <div class="form-group m-form__group row">

        <div class="col-lg-6">
            <label for="parent_id">{!! trans('main.parent_category') !!}</label>
            {!! Form::select('parent_id',App\Models\ItemCategory::get()->pluck('name','id'),null,['class'=>'form-control
            m-input select2','autocomplete'=>'off','id'=>'parent_category','placeholder'=>trans('main.parent_category')])!!}
        </div>


        <div class="col-lg-6">
            <label for="name">{!! trans('main.name') !!}</label>
            {!! Form::text('name',null,['class'=>'form-control
            m-input','autocomplete'=>'off','id'=>'name','placeholder'=>trans('main.name')])!!}
        </div>
    </div>

    <div class="form-group m-form__group row">
        <div class="col-lg-12">
            <label for="notes">{!! trans('main.notes') !!}</label>
            {!! Form::textarea('notes',null,['class'=>'form-control
            m-input','autocomplete'=>'off','id'=>'notes','placeholder'=>trans('main.notes'),'rows'=>3])!!}
        </div>
    </div>
  
    <div class="form-group m-form__group row">
        <table class="table table-striped- table-bordered dataTable table-hover table-checkable" id="tableData">
            <thead>
                <th>{{__('main.name')}}</th>
                <th>{{__('main.notes')}}</th>
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
    @if (!empty($resource->categories))
        @foreach($resource->categories as $category)
            $('#tableData tbody').append(tableRow({!!$category !!}));
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
        var name = '';
        var notes = '';
        if (row != null) {
            // console.log(row);
            name = row.name;
            notes = row.notes;
        }

        var rowHtml = '<tr>'
                        +'<td>'
                        +'<input  name="categories[name][]" type="text" class="form-control" value="'+name+'">'
                        +'</td>'
                        +'<td>'
                        +'<input  name="categories[notes][]" type="text" class="form-control" value="'+notes+'">'
                        +'</td>'
                        +'<td>'
                        +'<button class="btn btn-sm btn-danger deleteRecord"><i class="fa fa-trash"></i></button>'
                        +'</td>'
                    +'</tr>';
        return rowHtml;
    }


    
</script>
@endsection