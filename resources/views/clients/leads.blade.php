<div class="row">

    <div class="col-sm-12">
        <div class="table-responsive">
            <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
                <thead>
                <tr>
                    <th>#</th>

                    <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='title') ? 'sorting_'.$date['sorttype'] :''}}"
                        data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='title') ? $date['sorttype'] :'asc'}}"
                        data-column_name="title" style="cursor: pointer">{!!
                        trans('main.title') !!}<span id="title_icon"></span></th>
                    <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='details') ? 'sorting_'.$date['sorttype'] :''}}"
                        data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='details') ? $date['sorttype'] :'asc'}}"
                        data-column_name="details" style="cursor: pointer">{!!
                        trans('main.details') !!}
                        <span id="details_icon"></span>
                    </th>
                    {{--   <th class="sorting
                           {{(isset($date['sorttype']) && $date['sortby']=='employee_id') ? 'sorting_'.$date['sorttype'] :''}}"
                           data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='employee_id') ? $date['sorttype'] :'asc'}}"
                           data-column_name="employee_id" style="cursor: pointer">{!!
                               trans('main.employee') !!}
                           <span id="employee_icon"></span>
                       </th>--}}
                    <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='client_id') ? 'sorting_'.$date['sorttype'] :''}}"
                        data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='client_id') ? $date['sorttype'] :'asc'}}"
                        data-column_name="client_id" style="cursor: pointer">{!!
                        trans('main.client') !!}
                        <span id="client_icon"></span>
                    </th>
                    <th> {!! trans('main.lead_status') !!}  </th>
                    @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('leads edit')||
                     Auth()->user()->can('leads destroy')||
                     Auth()->user()->can('leads show')
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
                @foreach($resource->leads as $row)
                    <tr class="table_tr" id="removable{{$row->id}}">
                        <td>{!!$loop->iteration!!}</td>

                        <td>{!!$row->title!!}</td>
                        <td>{!!$row->details!!}</td>
                        {{--                    <td>{!!optional($row->employee)->name!!}</td>--}}
                        <td>{!!optional($row->client)->name!!}</td>
                        <td>
                    <span data-toggle="m-tooltip" data-placement="top" title=""
                          data-original-title="{{trans('main.change_status')}}">
                            <button class="btn btn-brand  " id="changestatus{{$row->id}}" type="button"
                                    onclick="showmodelchange({!! $row->lead_status_id !!},{!! $row->id !!})">
                            {!!optional($row->status)->name!!}
                            </button>

                        </span>
                        </td>
                        @if(Auth()->user()->is_super_admin ||
                         Auth()->user()->can('leads edit')||
                         Auth()->user()->can('leads destroy')||
                         Auth()->user()->can('leads show')
                         )
                            <td>
                                @if(Auth()->user()->is_super_admin ||
                                 Auth()->user()->can('leads show')
                                 )
                                    <a href="{!!route('leads.show',$row->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                       data-placement="top" title="" data-original-title="{{__('main.show')}}">
                                        <i class="la la-eye"></i>
                                    </a>
                                @endif
                                @if(Auth()->user()->is_super_admin ||
                             Auth()->user()->can('leads edit')
                             )
                                    <a href="{!!route('leads.edit',$row->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                       data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                                        <i class="la la-edit"></i>
                                    </a>
                                @endif
                                @if(Auth()->user()->is_super_admin ||
                              Auth()->user()->can('leads destroy')
                              )
                                    <button
                                        class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy"
                                        data-toggle="m-tooltip" data-placement="top" title=""
                                        data-original-title="{{trans('main.delete')}}"
                                        data-route="{!!route('leads.destroy',$row->id)!!}" data-token="">
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