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
                     Auth()->user()->can($basicRoute.' edit')||
                     Auth()->user()->can($basicRoute.' destroy')||
                     Auth()->user()->can($basicRoute.' show')
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
                @foreach($resources as $resource)
                <tr class="table_tr" id="removable{{$resource->id}}">
                    <td>{!!$loop->iteration!!}</td>

                    <td>{!!$resource->name!!}</td>
                    <td>{!!$resource->email!!}</td>
                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can($basicRoute.' edit')||
                     Auth()->user()->can($basicRoute.' destroy')||
                     Auth()->user()->can($basicRoute.' show')
                     )
                    <td>

                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can($basicRoute.' show')
                     )
                        <a href="{!!route($basicRoute.'.show',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.show')}}">
                            <i class="fa fa-eye"></i>
                        </a>
                        @endif
                        @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can($basicRoute.' edit')
                     )
                        <a href="{!!route($basicRoute.'.edit',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                            <i class="fa fa-edit"></i>
                        </a>
                       @endif
                       @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can($basicRoute.' destroy')
                     )
                        <button class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy delete_icon" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="حذف"
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
