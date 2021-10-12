<div class="form-group">
        <div id="m_repeater_1">
            <div class="form-group  m-form__group" id="m_repeater_1">
                <label>{{trans('main.phones')}}</label>
                <div data-repeater-list="contacts" class="">
                    @if(isset($resource->phones) && !empty($resource->phones) && $resource->phones()->get()->count() > 0 )
                    @foreach($resource->phones as $phone)
                    <div class="d-flex">
                        <div>
                    <div data-repeater-item class="d-flex phones_section">
                        <div class="m-form__control">
                            <input type="text" name="phone"  class="form-control m-input" placeholder="{{trans('main.phone')}}" value="{{$phone->phone}}" autocomplete="off">
                        </div>
                        <div class="m-form__control">
                            <input type="text" name="notes" class="form-control m-input" placeholder="{{trans('main.notes')}}" value="{{$phone->notes}}" autocomplete="off">
                        </div>
                        <div data-repeater-delete="" class="btn-sm btn btn-danger m-btn m-btn--icon m-btn--pill">
                            <span>
                                <i class="la la-trash-o"></i>
                                <span>{{trans('main.delete')}}</span>
                            </span>
                        </div>
                    </div>
                    </div>
                    @if($loop->iteration ==1 )
                        <div data-repeater-create="" class="base_btn">
                            <i class="fa fa-plus"></i>
                            <span>إضافة</span>
                        </div>
                    @endif
                    </div>
                    @endforeach
                    @else
                    <div class="d-flex">
                        <div>
                            <div data-repeater-item class="d-flex phones_section">
                                <div class="m-form__control">
                                    <input type="text" name="phone"  class="form-control m-input" placeholder="{{trans('main.phone')}}" autocomplete="off">
                                </div>
                                <div class="m-form__control">
                                    <input type="text" name="notes" class="form-control m-input" placeholder="{{trans('main.notes')}}" autocomplete="off">
                                </div>
                                <div data-repeater-delete="" class="btn-sm btn btn-danger m-btn m-btn--icon m-btn--pill">
                                    <span>
                                        <i class="la la-trash-o"></i>
                                        <span>{{trans('main.delete')}}</span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div data-repeater-create="" class="base_btn">
                            <i class="fa fa-plus"></i>
                            <span>إضافة</span>
                        </div>
                    </div>
                    
                    @endif
                </div>
            </div>
        </div>
</div>  

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

            if (row.phones != null) {
                phone = row.phones;
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