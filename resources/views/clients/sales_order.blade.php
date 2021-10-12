<div class="row">

    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
                <tr>
                    <th>#</th>

                    <th class="sorting
                    {{(isset(request()->sortby) && request()->sortby=='name') ? 'sorting_'.request()->sorttype :''}}" data-sorting_type="{{(isset(request()->sorttype) && request()->sortby=='name') ? request()->sorttype :'asc'}}"
                    data-column_name="name" style="cursor: pointer">{!!
                        trans('main.name') !!}<span id="name_icon"></span></th>
                    <th class="sorting
                    {{(isset(request()->sorttype) && request()->sortby=='email') ? 'sorting_'.request()->sorttype :''}}" data-sorting_type="{{(isset(request()->sorttype) && request()->sortby=='email') ? request()->sorttype :'asc'}}"
                    data-column_name="email" style="cursor: pointer">{!!
                        trans('main.email') !!}
                        <span id="email_icon"></span>
                    </th>
                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales_order edit')||
                     Auth()->user()->can('sales_order destroy')||
                     Auth()->user()->can('sales_order show')
                     )
                    <th class="client_actions">{{trans('main.actions')}}</th>
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
                @foreach($resource->sales_orders as $row)
                <tr class="table_tr" id="removable{{$row->id}}">
                    <td>{!!$loop->iteration!!}</td>

                    <td>{!!$row->name!!}</td>
                    <td>{!!$row->email!!}</td>
                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales_order edit')||
                     Auth()->user()->can('sales_order destroy')||
                     Auth()->user()->can('sales_order show')
                     )
                    <td>

                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales_order show')
                     )
                        <a href="{!!route('sales_order.show',$row->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.show')}}">
                            <i class="la la-eye"></i>
                        </a>
                        @endif
                        @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales_order edit')
                     )
                        <a href="{!!route('sales_order.edit',$row->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                            <i class="la la-edit"></i>
                        </a>
                       @endif
                       @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales_order destroy')
                     )
                        <button class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="حذف"
                            data-route="{!!route('sales_order.destroy',$row->id)!!}" data-token="">
                            <i class="la la-trash"></i>
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