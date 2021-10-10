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
                        {!! trans('main.purchase_invoice_number') !!}
                    </th>
                    <th>
                        {!! trans('main.supplier') !!}
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
                     Auth()->user()->can('purchase invoices'.' edit')||
                     Auth()->user()->can('purchase invoices'.' destroy')||
                     Auth()->user()->can('purchase invoices'.' approve')||
                     Auth()->user()->can('purchase invoices'.' show')||
                     Auth()->user()->can('purchase invoices'.' print')
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
                    <td>{!!$resource->purchase_invoice_number!!}</td>
                    <td>{!!optional($resource->supplier)->name!!}</td>
                    <td>{!!optional($resource->inventory)->name!!}</td>
                    <td>{!!$resource->final_total!!}</td>
                    <td>{!!$resource->paid_amount!!}</td>
                    <td>{!!$resource->remaining_amount!!}</td>
                    <td>{!!$resource->date!!}</td>
                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('purchase invoices'.' edit')||
                     Auth()->user()->can('purchase invoices'.' destroy')||
                     Auth()->user()->can('purchase invoices'.' approve')||
                     Auth()->user()->can('purchase invoices'.' show')||
                     Auth()->user()->can('purchase invoices'.' print')
                     )
                    <td>

                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('purchase invoices'.' show')
                     )
                        <a href="{!!route($basicRoute.'.show',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.show')}}">
                            <i class="fa fa-eye"></i>
                        </a>
                        @endif
                        @if($resource->status == 'new')
                        @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('purchase invoices'.' approve')
                     )
                        <a href="{!!route($basicRoute.'.approve',$resource->id)!!}" class="m-portlet__nav-link btn m-btn

                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.approve')}}">
                            <i class="fa fa-check"></i>
                        </a>
                        @endif
                        @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('purchase invoices'.' edit')
                     )
                        <a href="{!!route($basicRoute.'.edit',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                            <i class="fa fa-edit"></i>
                        </a>
                    @endif
                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('purchase invoices'.' destroy')
                     )
                        <button class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy delete_icon" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.delete')}}"
                            data-route="{!!route($basicRoute.'.destroy',$resource->id)!!}" data-token="">
                            <i class="fa fa-trash"></i>
                        </button>
                        @endif
                        @else

                        @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('purchase invoices'.' print')
                     )
                            <a href="{!!route($basicRoute.'.print',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                                m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.print')}}" target="_blank">
                                        <i class="fa fa-print"></i>
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
@if(count($resources))
    @include("layouts.table_footer")
@endif
