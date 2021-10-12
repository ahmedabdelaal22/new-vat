<div class="">
    <div class="">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>
                        {!!trans('main.client') !!}
                    </th>

                    <th>
                        {!!trans('main.amount') !!}
                    </th>
                    <th>
                        {!!trans('main.date') !!}
                    </th>
                    <th>
                        {!!trans('main.status') !!}
                    </th>

                    <th>
                        {!!trans('main.created_by') !!}
                    </th>
                    <th>
                        {!!trans('main.confirmed_at') !!}
                    </th>
                    <th>
                        {!!trans('main.confirmer') !!}
                    </th>
                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('collection'.' edit')||
                     Auth()->user()->can('collection'.' destroy')||
                     Auth()->user()->can('collection'.' approve')||
                     Auth()->user()->can('collection'.' print')
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
                @foreach($resource->collection as $row)
                <tr class="table_tr" id="removable{{$row->id}}">

                    <td>{!!$loop->iteration!!}</td>
                    <td>{!!optional($row->client_user)->name!!}</td>
                    <td>{!!$row->amount!!}</td>
                    <td>{!!$row->date!!}</td>
                    <td>{!!__('main.'.$row->status)!!}</td>
                    <td>{!!optional($row->creator)->name!!}</td>
                    <td>{!!$row->confirmed_at!!}</td>
                    <td>{!!optional($row->confirmer)->name!!}</td>

                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('collection'.' edit')||
                     Auth()->user()->can('collection'.' destroy')||
                     Auth()->user()->can('collection'.' approve')||
                     Auth()->user()->can('collection'.' print')
                     )

                    <td>
                        @if($row->status == 'open')
                        @if(Auth()->user()->is_super_admin || Auth()->user()->can('collection approve'))
                        <a href="{!!route('collection.approve',$row->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.approve')}}">
                            <i class="la la-check"></i>
                        </a>
                        @endif
                        @if(Auth()->user()->is_super_admin || Auth()->user()->can('collection edit'))
                        <a href="{!!route('collection.edit',$row->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                            <i class="la la-edit"></i>
                        </a>
                        @endif
                        @if(Auth()->user()->is_super_admin || Auth()->user()->can('collection destroy'))

                        <button class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.delete')}}"
                            data-route="{!!route('collection.destroy',$row->id)!!}" data-token="">
                            <i class="la la-trash"></i>
                        </button>
                        @endif
                        @else
                        @if(Auth()->user()->is_super_admin || Auth()->user()->can('collection print'))
                        <a target="_blanck" href="{!!route('collection.print',$row->id)!!}" class="m-portlet__nav-link btn m-btn

                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.print')}}">
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