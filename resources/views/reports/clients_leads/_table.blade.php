<div class="row">
    <div class="col-sm-12">
        <div class="table-responsive">
            <table class="table table-bordered dataTable table-hover table-checkable
                             table-striped m-table m-table--head-bg-success custom_table"
                   id="m_table_1"
            >
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

                    <th class="sorting
                        {{(isset($date['sorttype']) && $date['sortby']=='created_at') ? 'sorting_'.$date['sorttype'] :''}}"
                        data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='created_at') ? $date['sorttype'] :'asc'}}"
                        data-column_name="created_at" style="cursor: pointer">{!!
                            trans('main.order_created_at') !!}
                        <span id="details_icon"></span>
                    </th>


                    <th class="sorting
                        {{(isset($date['sorttype']) && $date['sortby']=='lead_status_id') ? 'sorting_'.$date['sorttype'] :''}}"
                        data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='lead_status_id') ? $date['sorttype'] :'asc'}}"
                        data-column_name="details" style="cursor: pointer">{!!
                            trans('main.order_status') !!}
                        <span id="details_icon"></span>
                    </th>


                    <th class="sorting
                        {{(isset($date['sorttype']) && $date['sortby']=='client_id') ? 'sorting_'.$date['sorttype'] :''}}"
                        data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='client_id') ? $date['sorttype'] :'asc'}}"
                        data-column_name="client_id" style="cursor: pointer">{!!
                            trans('main.client') !!}
                        <span id="client_icon"></span>
                    </th>

                    <th class="sorting
                        {{(isset(request()->sortby) && request()->sortby=='responsables') ? 'sorting_'.request()->sorttype :''}}"
                        data-sorting_type="{{(isset(request()->sorttype) && request()->sortby=='responsables') ? request()->sorttype :'asc'}}"
                        data-column_name="name" style="cursor: pointer">
                        {!! trans('main.responsables') !!}<span id="name_icon"></span></th>
                    <th class="sorting
                        {{(isset(request()->sorttype) && request()->sortby=='leads_count') ? 'sorting_'.request()->sorttype :''}}"
                        data-sorting_type="{{(isset(request()->sorttype) && request()->sortby=='leads_count') ? request()->sorttype :'asc'}}"
                        data-column_name="email" style="cursor: pointer">{!!
                            trans('main.leads_count') !!}
                        <span id="email_icon"></span>
                    </th>

                    <th>{{trans('main.has_orders')}}</th>
                    <th>{{trans('main.has_invoices')}}</th>
                    <th>{{trans("main.last_lead_date")}}</th>
                    <th>{{trans("main.last_lead_details")}}</th>

                    @if(Auth()->user()->is_super_admin || Auth()->user()->can($basicRoute.' show')
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

                        <td>{!!$resource->title!!}</td>
                        <td>{!!$resource->details!!}</td>
                        <td>{!!$resource->created_at!!}</td>
                        <td>{!! optional($resource->status)->name!!}</td>

                        <td>{!!optional($resource->client)->name!!}</td>
                        <td>
                            <div class="col-lg-12">

                                @foreach($resource->responsables()  as $index=>$value )
                                    <span> {{\App\Models\User::find($value)->name}}</span>
                                @endforeach

                            </div>
                        </td>


                        <td>{!!$resource->operations->count()!!}</td>

                        <td align="center">
                            @if($resource->has_orders()>0)
                                <a href="{!!route("sales_order".'.by_leads',["lead_id"=>$resource->id])!!}" class="m-portlet__nav-link btn m-btn
                        m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                   data-placement="top" title="" data-original-title="{{__('main.show')}}">
                                    <i class="fa fa-eye"></i>
                                </a>
                            @endif
                        </td>


                        <td align="center">
                            @if($resource->has_invoices()>0)
                                <a href="{!!route("sales_invoices".'.by_leads',["lead_id"=>$resource->id])!!}" class="m-portlet__nav-link btn m-btn
                        m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                   data-placement="top" title="" data-original-title="{{__('main.show')}}">
                                    <i class="fa fa-eye"></i>
                                </a>
                            @endif
                        </td>


                        <td>
                            @if( optional($resource->last_lead())->operation_date )
                                <span> 
                                    <span class="">{{ optional($resource->last_lead())->operation_date }} - {{ optional($resource->last_lead())->operation_time }}</span> 
                                    <i class="fa fa-history"></i>
                                </span>
                                <br/>
                            @endif
                        </td>

                        <td>
                            @if( optional($resource->last_lead())->notes )
                                <span>{{trans("main.notes")}} {{ optional($resource->last_lead())->notes }}</span>
                            @endif
                        </td>


                        @if(Auth()->user()->is_super_admin ||
                             Auth()->user()->can($basicRoute.' show')
                             )
                            <td>
                                @if(Auth()->user()->is_super_admin ||
                                                         Auth()->user()->can($basicRoute.' show')
                                                         )
                                    <a href="{!!route("leads".'.show',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                        m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                       data-placement="top" title="" data-original-title="{{__('main.show')}}">
                                        <i class="fa fa-eye"></i>
                                    </a>
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
