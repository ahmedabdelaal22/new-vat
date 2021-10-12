<div class="row">


    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
            <tr>
                <th>#</th>
                <th>
                    {!! trans('main.code') !!}
                </th>

                <th>
                    {!! trans('main.client') !!}
                </th>
                <th>
                    {!! trans('main.inventory') !!}
                </th>
                <th>
                    {!! trans('main.final_total') !!}
                </th>
                <th>
                    {!! trans('main.date') !!}
                </th>
                <th>
                    {!! trans('main.confirmed_at') !!}
                </th>
                @if(Auth()->user()->is_super_admin ||
                 Auth()->user()->can('sales order'.' edit')||
                 Auth()->user()->can('sales order'.' destroy')||
                 Auth()->user()->can('sales order'.' confirem')||
                 Auth()->user()->can('sales order'.' show')||
                 Auth()->user()->can('sales order'.' print')
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
                    <td>{!!optional($resource->client_user)->name!!}</td>
                    <td>{!!optional($resource->inventory)->name!!}</td>
                    <td>{!!$resource->final_total!!}</td>
                    <td>{!!$resource->date!!}</td>

                    <td class="confirmed_at{!!$resource->id!!}">{!!$resource->confirmed_at!!}</td>
                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales order'.' edit')||
                     Auth()->user()->can('sales order'.' destroy')||
                     Auth()->user()->can('sales order'.' confirm')||
                     Auth()->user()->can('sales order'.' show')||
                     Auth()->user()->can('sales order'.' print')
                     )
                    <td>


                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales order'.' show')
                     )
                        <a href="{!!route($basicRoute.'.show',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                           data-placement="top" title="" data-original-title="{{__('main.show')}}">
                            <i class="fa fa-eye"></i>
                        </a>
                        @endif

                        @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales invoices create')
                     )
                        <a href="{!!route('sales_invoices.create',['sales_order_id'=>$resource->id])!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                           data-placement="top" title="" data-original-title="{{__('main.convert_to_sales_invoices')}}">
                            <i class="fa fa-shopping-cart"></i>
                        </a>
                        @endif
                            @if(Auth()->user()->is_super_admin ||
                         Auth()->user()->can('sales order'.' print')
                         )
                            <a href="{!!route($basicRoute.'.print',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.print')}}" target="_blank">
                                    <i class="fa fa-print"></i>
                                </a>
                            @endif


                            @if(empty($resource->confirmed_at))
                        @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales order'.' edit')
                     )
                            <a href="{!!route($basicRoute.'.edit',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                        m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill edit{!!$resource->id!!}" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                                <i class="fa fa-edit"></i>
                            </a>
                           @endif
                           

                            @if(Auth()->user()->is_super_admin ||
                         Auth()->user()->can('sales order'.' confirem')
                         )
                            <button class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill confirem confirmed{!!$resource->id!!} confirem_icon" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.approve')}}"
                                data-route="{!!route($basicRoute.'.confirem',$resource->id)!!}" data-token="">
                                <i class="fa fa-check-circle"></i>
                            </button>
                            @endif
                         @endif
                         @if(Auth()->user()->is_super_admin ||
                         Auth()->user()->can('sales order'.' destroy')
                         )
                            <button class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy  deleted{!!$resource->id!!} delete_icon" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.delete')}}"
                                data-route="{!!route($basicRoute.'.destroy',$resource->id)!!}" data-token="">
                                <i class="fa fa-trash"></i>
                            </button>

                            @endif

                    </td>
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
