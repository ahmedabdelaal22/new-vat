<div align="center">
    <div class="form-group m-form__group " align="center">
        <table width="100%" class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table"
               id="InvoiceTableData">
            <thead class="thead-light">
            <th style="width: 150px!important">
                {{__('main.attribute')}}
            </th>
            <th style="width: 111px!important">
                {{__('main.values')}}
            </th>
            </thead>
            <tbody>
            <tr>
                <td>{{trans("main.old_values")}}</td>
                <td>
                    @foreach (json_decode($resource->old_values) as $id=>$value)
                        <span>{!!  $id .":". $value !!}</span>  </br>
                    @endforeach
                </td>
            </tr>
            <tr>
                <td>{{trans("main.new_values")}}</td>
                <td>
                    @foreach (json_decode($resource->new_values) as $id=>$value)
                        <span>{!!  $id .":". $value !!}</span>  </br>
                    @endforeach
                </td>
            </tr>
            </tbody>
            <tfoot>

            </tfoot>
        </table>
    </div>

</div>
