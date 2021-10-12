<div class="row">

    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
                <tr>
                    <th>#</th>
                    <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='name') ? 'sorting_'.$date['sorttype'] :''}}" data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='name') ? $date['sorttype'] :'asc'}}"
                    data-column_name="name" style="cursor: pointer">{!!
                        trans('main.name') !!}<span id="name_icon"></span></th>

                    <th>
                        {!!trans('main.category') !!}
                    </th>

                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can($basicRoute.' edit')||
                     Auth()->user()->can($basicRoute.' destroy')
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
                    <td>{!!$resource->name!!}</td>
                    <td>{!!@$resource->category->name!!}</td>
                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can($basicRoute.' edit')||
                     Auth()->user()->can($basicRoute.' destroy')
                     )
                    <td>
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

                        <button class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy delete_icon" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.delete')}}"
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
