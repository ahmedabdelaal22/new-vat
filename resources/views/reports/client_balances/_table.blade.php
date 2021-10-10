<div class="row">

    <div class="col-sm-12 table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
            <tr>
                <th>#</th>
                <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='client_id') ? 'sorting_'.$date['sorttype'] :''}}"
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='client_id') ? $date['sorttype'] :'asc'}}"
                    data-column_name="client_id" style="cursor: pointer">{!!
                        trans('main.client') !!}
                    <span id="client_icon"></span>
                </th>
                <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='code') ? 'sorting_'.$date['sorttype'] :''}}"
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='code') ? $date['sorttype'] :'asc'}}"
                    data-column_name="code" style="cursor: pointer">
                    {!! trans('main.code_salse_invoice') !!}
                    <span id="title_icon"></span>
                </th>
                <th>
                {!! trans('main.date') !!}
                </th>
                <th>
                {!! trans('main.final_total') !!}
                </th>
                <th>
                {!! trans('main.paid_amount') !!}
                </th>
                <th>
                {!! trans('main.remaining_amount') !!}
                </th>
                <th>
                    {!! trans('main.client_balance') !!}
                </th>


                @if(Auth()->user()->is_super_admin || Auth()->user()->can($basicRoute.' show')
                 )

                    <th>{{trans('main.actions')}}</th>
                @endif

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
                    <td>{!!optional($resource->client)->name!!}</td>
                    <td>{!!$resource->code!!}</td>
                    <td>{!!$resource->confirmed_at!!}</td>
                    <td>{!!$resource->final_total!!}</td>
                    <td>{!!$resource->paid_amount!!}</td>
                    <td>{!!$resource->remaining_amount!!}</td>
                    <td>{!!optional($resource->client)->balance!!}</td>


                        <td>


                        </td>


                </tr>


            @endforeach
            </tbody>
        </table>

    </div>
</div>
@if(count($resources))
    @include("layouts.table_footer")
@endif

