<div class="row">

    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>
                        {!! trans('main.client') !!}
                    </th>
                    <th>
                        {!! trans('main.sales_invoice') !!}
                    </th>

                    <th>
                        {{trans('main.money_amount')}}
                    </th>
                    <th>
                        {{trans('main.date')}}
                    </th>


                </tr>
            </thead>
            <div id="load">
                <div class="lds-roller">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <tbody class="date">
                @foreach($resources as $resource)
                <tr class="table_tr" id="removable{{$resource->id}}">
                    <td>{!!$loop->iteration!!}</td>
                    <td>{!!optional($resource->client_user)->name!!}</td>
                    <td>{!!optional($resource->invoice)->code!!}</td>
                    <td>{!!$resource->amount!!}</td>
                    <td>{!!$resource->date!!}</td>
                </tr>
                @endforeach

            </tbody>
        </table>
        </div>
    </div>
</div>
@if(count($resources))
    @include("layouts.table_footer")
@endif
