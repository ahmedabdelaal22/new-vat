<div class="">

    <div class="">
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
                        {!! trans('main.paid_amount') !!}
                    </th>

                    <th>
                        {!! trans('main.remaining_amount') !!}
                    </th>

                    <th>
                        {!! trans('main.date') !!}
                    </th>
                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales invoices'.' edit')||
                     Auth()->user()->can('sales invoices'.' destroy')||
                     Auth()->user()->can('sales invoices'.' approve')||
                     Auth()->user()->can('sales invoices'.' show')||
                     Auth()->user()->can('sales invoices'.' print')
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
                @foreach($resource->sales_invoices as $row)
                    <tr class="table_tr" id="removable{{$row->id}}">
                        <td>{!!$loop->iteration!!}</td>
                        <td>{!!$row->code!!}</td>
                        <td>{!!optional($row->client)->name!!}</td>
                        <td>{!!optional($row->inventory)->name!!}</td>
                        <td>{!!$row->final_total!!}</td>
                        <td>{!!$row->paid_amount!!}</td>
                        <td>{!!$row->remaining_amount!!}</td>
                        <td>{!!$row->date!!}</td>
                        @if(Auth()->user()->is_super_admin ||
                         Auth()->user()->can('sales invoices'.' edit')||
                         Auth()->user()->can('sales invoices'.' destroy')||
                         Auth()->user()->can('sales invoices'.' approve')||
                         Auth()->user()->can('sales invoices'.' show')||
                         Auth()->user()->can('sales invoices'.' print')
                         )
                            <td>

                                @if(Auth()->user()->is_super_admin ||
                                 Auth()->user()->can('sales invoices'.' show')
                                 )
                                    <a href="{!!route('sales_invoices.show',$row->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                       data-placement="top" title="" data-original-title="{{__('main.show')}}">
                                        <i class="la la-eye"></i>
                                    </a>
                                @endif
                                @if($row->status == 'new')
                                    @if(Auth()->user()->is_super_admin ||
                                 Auth()->user()->can('sales invoices'.' approve')
                                 )
                                        <a href="{!!route('sales_invoices.approve',$row->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                           data-placement="top" title="" data-original-title="{{__('main.approve')}}">
                                            <i class="la la-check"></i>
                                        </a>
                                    @endif
                                    @if(Auth()->user()->is_super_admin ||
                                 Auth()->user()->can('sales invoices'.' edit')
                                 )
                                        <a href="{!!route('sales_invoices.edit',$row->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                           data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                                            <i class="la la-edit"></i>
                                        </a>
                                    @endif
                                    @if(Auth()->user()->is_super_admin ||
                                 Auth()->user()->can('sales invoices'.' destroy')
                                 )
                                        <button
                                            class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy"
                                            data-toggle="m-tooltip" data-placement="top" title=""
                                            data-original-title="{{__('main.delete')}}"
                                            data-route="{!!route('sales_invoices.destroy',$row->id)!!}"
                                            data-token="">
                                            <i class="la la-trash"></i>
                                        </button>
                                    @endif
                                @else
                                    @if(Auth()->user()->is_super_admin ||
                                 Auth()->user()->can('sales invoices'.' print')
                                 )
                                        <a href="{!!route('sales_invoices.print',$row->id)!!}" class="m-portlet__nav-link btn m-btn
                                m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                           data-placement="top" title="" data-original-title="{{__('main.print')}}"
                                           target="_blank">
                                            <i class="la la-print"></i>
                                        </a>
                                    @endif
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