<div class="row">


    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table"
               id="m_table_1"    >
            <thead>
            <tr>
                <th>#</th>

                <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='title') ? 'sorting_'.$date['sorttype'] :''}}"
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='title') ? $date['sorttype'] :'asc'}}"
                    data-column_name="title" style="cursor: pointer">{!!
                        trans('main.title') !!}<span id="title_icon"></span></th>

                <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='created_at') ? 'sorting_'.$date['sorttype'] :''}}"
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='created_at') ? $date['sorttype'] :'asc'}}"
                    data-column_name="created_at" style="cursor: pointer">{!!
                        trans('main.order_created_at') !!}
                    <span id="details_icon"></span>
                </th>


                <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='lead_status_id') ? 'sorting_'.$date['sorttype'] :''}}"
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='lead_status_id') ? $date['sorttype'] :'asc'}}"
                    data-column_name="details" style="cursor: pointer">{!!
                        trans('main.order_status') !!}
                    <span id="details_icon"></span>
                </th>


                <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='client_id') ? 'sorting_'.$date['sorttype'] :''}}"
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='client_id') ? $date['sorttype'] :'asc'}}"
                    data-column_name="client_id" style="cursor: pointer">{!!
                        trans('main.client') !!}
                    <span id="client_icon"></span>
                </th>

                <th>{{trans('main.code')}}</th>

                <th>{{trans('main.date')}}</th>

                <th>{{trans('main.paid_amount')}}</th>

                <th>{{trans('main.remaining_amount')}}</th>

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
                    <td>{!!optional($resource->lead)->title!!}</td>
                    <td>{!!optional($resource->lead)->created_at!!}</td>
                    <td>{!! optional(optional($resource->lead)->status)->name!!}</td>
                    <td>{!! optional($resource->client)->name!!}</td>
                    <td>{!!$resource->code !!}</td>
                    <td>{!!$resource->date !!}</td>
                    <td>{!!$resource->paid_amount !!}</td>
                    <td>{!!$resource->remaining_amount !!}</td>
                    @if(Auth()->user()->is_super_admin || Auth()->user()->can('sales_invoices'.' show') )
                        <td><a href="{!!route('sales_invoices'.'.show',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                               data-placement="top" title="" data-original-title="{{__('main.show')}}">
                                <i class="fa fa-eye"></i>
                            </a></td>
                    @endif
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
