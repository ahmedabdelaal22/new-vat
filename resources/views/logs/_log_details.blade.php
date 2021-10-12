<div align="center">
    <div class="form-group m-form__group " align="center">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table" id="InvoiceTableData">
            <thead class="thead-light">
            <th style="width: 150px!important">
                {{__('main.attribute')}}
            </th>
            <th style="width: 111px!important">
                {{__('main.value')}}
            </th>
            </thead>
            <tbody>
            <tr>
                <td>#</td>
                <td>{{$resource->id}}</td>
            </tr>
            <tr>
                <td>{{trans("main.user_type")}}</td>
                <td>{{$resource->user_type}}</td>
            </tr>
            <tr>
                <td>{{trans("main.user")}}</td>
                <td>{{\App\Models\User::find($resource->user_id)->name}}</td>
            </tr>
            <tr>
                <td>{{trans("main.event")}}</td>
                <td>{{$resource->event}}</td>
            </tr>
            <tr>
                <td>{{trans("main.auditable_type")}}</td>
                <td>{{$resource->auditable_type}}</td>
            </tr>
            <tr>
                <td>{{trans("main.auditable_id")}}</td>
                <td>{{$resource->auditable_id}}</td>
            </tr>
            <tr>
                <td>{{trans("main.url")}}</td>
                <td>{{$resource->url}}</td>
            </tr>
            <tr>
                <td>{{trans("main.ip_address")}}</td>
                <td>{{$resource->ip_address}}</td>
            </tr>
            <tr>
                <td>{{trans("main.user_agent")}}</td>
                <td>{{$resource->user_agent}}</td>
            </tr>
            <tr>
                <td>{{trans("main.tags")}}</td>
                <td>{{$resource->tags}}</td>
            </tr>
            <tr>
                <td>{{trans("main.created_at")}}</td>
                <td>{{$resource->created_at}}</td>
            </tr>

            {{--        {!!--}}

            {{--//        $model = app("App\Models\Client");--}}
            {{--//        var_dump($model->audits());--}}
            {{-- //       die(app("App\Models\Client")::find(10)->audits()->find(31));--}}
            {{--        !!}--}}


            </tbody>
            <tfoot>

            </tfoot>
        </table>
    </div>


</div>
