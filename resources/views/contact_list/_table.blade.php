<div class="row">

    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
            <tr>
                <th>#</th>

                <th class="sorting
                    {{(isset(request()->sortby) && request()->sortby=='name') ? 'sorting_'.request()->sorttype :''}}"
                    data-sorting_type="{{(isset(request()->sorttype) && request()->sortby=='name') ? request()->sorttype :'asc'}}"
                    data-column_name="name" style="cursor: pointer">{!!
                        trans('main.name') !!}<span id="name_icon"></span></th>
                <th class="sorting
                    {{(isset(request()->sorttype) && request()->sortby=='email') ? 'sorting_'.request()->sorttype :''}}"
                    data-sorting_type="{{(isset(request()->sorttype) && request()->sortby=='email') ? request()->sorttype :'asc'}}"
                    data-column_name="email" style="cursor: pointer">{!!
                        trans('main.email') !!}
                    <span id="email_icon"></span>
                </th>
                <th>
                {!!   trans('main.phone') !!}
                </th>



                @if(Auth()->user()->is_super_admin ||
                 Auth()->user()->can('contact list edit')||
                 Auth()->user()->can('contact list destroy')
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
                    <td>{!!optional($resource->client)->email!!}</td>
                    <td>{!!$resource->phone!!}</td>
                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can( 'contact list edit')||
                     Auth()->user()->can('contact list destroy')
                     )
                        <td>
                            @if(Auth()->user()->is_super_admin ||  Auth()->user()->can(  'contact list edit')  )
                                @if(!empty($resource->client_id))
                                    <a href="{!!route($basicRoute.'.edit',$resource->client_id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                       data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                                        <i class="la la-edit"></i>
                                    </a>
                                @endif
                            @endif
                            @if(Auth()->user()->is_super_admin ||
                          Auth()->user()->can('contact list destroy')
                          )
                                <button
                                    class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy"
                                    data-toggle="m-tooltip" data-placement="top" title="" data-original-title="حذف"
                                    data-route="{!!route($basicRoute.'.destroy',$resource->id)!!}" data-token="">
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
@if(count($resources))
    @include("layouts.table_footer")
@endif
