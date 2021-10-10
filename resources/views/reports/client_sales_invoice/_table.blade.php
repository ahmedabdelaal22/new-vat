<div class="row">
    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
            <tr>
                <th>#</th>

                <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='code') ? 'sorting_'.$date['sorttype'] :''}}"
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='code') ? $date['sorttype'] :'asc'}}"
                    data-column_name="code" style="cursor: pointer">
                    {!! trans('main.code') !!}
                    <span id="title_icon"></span></th>
              <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='client_id') ? 'sorting_'.$date['sorttype'] :''}}"
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='client_id') ? $date['sorttype'] :'asc'}}"
                    data-column_name="client_id" style="cursor: pointer">{!!
                        trans('main.client') !!}
                    <span id="client_icon"></span>
                </th>

                <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='inventory_id') ? 'sorting_'.$date['sorttype'] :''}}"
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='inventory_id') ? $date['sorttype'] :'asc'}}"
                    data-column_name="inventory_id" style="cursor: pointer">{!!
                        trans('main.Inventory') !!}
                    <span id="client_icon"></span>
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
                    {!! trans('main.discount') !!}
                </th>
                <th>
                    {!! trans('main.date') !!}
                </th>
          
                <th>
                    {!! trans('main.items') !!}
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

                    <td>{!!$resource->code!!}</td>
                    <td>{!!optional($resource->client)->name!!}</td>
                    <td>{!!optional($resource->inventory)->name!!}</td>
                    <td>{!!$resource->final_total!!}</td>
                    <td>{!!$resource->paid_amount!!}</td>
                    <td>{!!$resource->remaining_amount!!}</td>
                    <td>{!!$resource->discount!!}</td>
                    <td>{!!$resource->confirmed_at!!}</td>
                    <td>{!!optional($resource->lead)->title!!}</td>
                    <td>

                        <div class="col-lg-12">

                            @foreach($resource->items as $item)
                                <span> {{optional($item->item)->name}},</span>
                            @endforeach

                        </div>
                    </td>

                        <td>

                        {{--        <a href="{!!@route("leads".'.show',optional($resource->lead)->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                   data-placement="top" title="" data-original-title="{{__('main.show')}}">
                                    <i class="fa fa-eye"></i>
                                </a>--}}


                        </td>


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

