<div class="row">
    <div class="col-lg-12">
        <div class="table_actions d-flex justify-content-between">

            <div class="dataTables_length">
                <div class="d-flex">
                    <label class="label_text">{{trans('main.show')}}</label>
                    <select name="limit"
                            class="custom-select custom-select-sm form-control form-control-sm "
                            id="limit">
                        <option value="10">10</option>
                        <option value="25">25</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
            <tr>
                <th>#</th>

                <th>
                {!! trans('main.connection_way') !!}
                </th>
                <th>
                {!! trans('main.connection_way_status') !!}
                </th>
                <th>
                {!! trans('main.date') !!}
                </th>
                <th>
                {!! trans('main.client') !!}
                </th>
                <th>
                {!! trans('main.employee') !!}
                </th>
                <th>
                {!! trans('main.contact_list') !!}
                </th>
                <th>
                    {!! trans('main.order_status') !!}
                </th>
                <th>
                    {!! trans('main.lead_title') !!}
                </th>
                <th>{{trans('main.actions')}}</th>

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
                <tr class="table_tr" id="close{{$resource->id}}">
                    <td>{!!$loop->iteration!!}</td>

                    <td>{!!optional(@$resource->connection_way)->name!!}</td>
                    <td>{!!optional($resource->connection_way_status)->name!!}</td>

                    <td>
                        {!!$resource->operation_date!!}
                        {!!$resource->operation_time!!}
                    </td>
                    <td>{!!optional(@$resource->lead->client)->name!!}</td>
                    <td>{!!optional(@$resource->user)->name!!}</td>

                    <td>
                        @if(@$resource->lead->client->phones)
                        @foreach(@$resource->lead->client->phones as $row)
                        {{$row->phone}}
                        @endforeach
                        @endif
                    </td>
      
                    <td>{!!optional(@$resource->lead->status)->name!!}</td>
                    <td>{!!optional(@$resource->lead)->title!!}</td>
                    <td>
                        @if($resource->status =='new')
                    <button class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill close close{!!$resource->id!!}" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.close')}}"
                                data-route="{!!route($basicRoute.'.close',$resource->id)!!}" data-token="">
                                <i class="fa fa-check"></i>
                            </button>
                            @endif
                            
                     </td>
                </tr>


            @endforeach
            </tbody>
        </table>
        </div>

    </div>
</div>
@if(count($resources))
    <div class="row">
        <div class="col-sm-12 col-md-5">
            <div class="dataTables_info" id="m_table_1_info" role="status" aria-live="polite">{{__('main.show')}}
                {{$resources->firstItem()}} {{__('main.to')}} {{$resources->lastItem()}} {{__('main.from')}} {{$resources->total()}}
                {{__('main.record')}}
            </div>
        </div>
        <div class="col-sm-12 col-md-7">
            <div class="dataTables_paginate paging_full_numbers" id="m_table_1_paginate">
                {{$resources->links()}}
            </div>
        </div>
    </div>
@endif
