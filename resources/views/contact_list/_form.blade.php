<div class="m-portlet__body">
    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="name">{!! trans('main.name') !!}</label>
            {!! Form::text('name',null,['class'=>'form-control
            m-input','id'=>'name', 'autocomplete'=>'off','placeholder'=>trans('main.name')])!!}
        </div>
        <div class="col-lg-6">
            <label for="email">{!! trans('main.email') !!}</label>
            {!! Form::text('email',null,['class'=>'form-control
            m-input','id'=>'email', 'autocomplete'=>'off', 'placeholder'=>trans('main.email')])!!}
        </div>
    </div>
    @include('clients._phones')
{{--
    <div class="form-group m-form__group ">
        <label>{!! trans('main.phones') !!}</label>

        <table class="table table-striped- table-bordered dataTable table-hover table-checkable" id="tableData">
            <thead>
                <th>{{__('main.phone')}}</th>
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
    --}}
</div>
{{--
@section('scripts')
<script type="text/javascript">

    @if (!empty($resource->phones))
        @foreach($resource->phones as $phone)
            $('#tableData tbody').append(tableRow({!!$phone !!}));
        @endforeach
    @else
        $('#tableData tbody').append(tableRow());
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
        var phone = '';
        var notes = '';
        if (row != null) {
            if (row.phone != null) {
                phone = row.phone;
            }

            if (row.notes != null) {
                notes = row.notes;
            }
        }

        var rowHtml = '<tr>'
                        +'<td>'
                        +'<input  name="contacts[phones][]" type="text" class="form-control" value="'+phone+'">'
                        +'</td>'
                        +'<td>'
                        +'<input  name="contacts[notes][]" type="text" class="form-control" value="'+notes+'">'
                        +'</td>'
                        +'<td>'
                        +'<button class="btn btn-sm btn-danger deleteRecord"><i class="fa fa-trash"></i></button>'
                        +'</td>'
                    +'</tr>';
        return rowHtml;
    }


    
</script>
@endsection
--}}