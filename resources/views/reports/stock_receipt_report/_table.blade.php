<div class="row">


    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table"
               id="m_table_1">
            <thead>
            <tr>
                <th>#</th>

                <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='title') ? 'sorting_'.$date['sorttype'] :''}}"
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='title') ? $date['sorttype'] :'asc'}}"
                    data-column_name="title" style="cursor: pointer">{!!
                        trans('main.inventory') !!}<span id="title_icon"></span></th>

                <th>{{trans('main.item')}}</th>

                <th>{{trans('main.inner')}}</th>

                <th>{{trans('main.outer')}}</th>

                <th>{{trans('main.result')}}</th>

                <th>{{trans('main.unit_price')}}</th>
                <th>{{trans('main.purchase_price')}}</th>
                <th>{{trans('main.sale_price')}}</th>


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
                <tr class="table_tr">
                    <td>{!!$loop->iteration!!}</td>
                    <td>{!! $resource->inventory_name!!}</td>
                    <td>{!!$resource->item_name !!}</td>
                    <td>{!!$resource->inner!!}</td>
                    <td>{!!$resource->outer!!}</td>
                    <td>{!!$resource->result!!}</td>
                    <td>{!!$resource->unit_price!!}</td>
                    <td>{!!$resource->purchase_price!!}</td>
                    <td>{!!$resource->sale_price!!}</td>


                </tr>


            @endforeach

            </tbody>
        </table>
    </div>
    </div>
</div>
@if(count($resources))
    <div class="d-flex justify-content-between">
        <div class="">
            <div class="dataTables_info" id="m_table_1_info" role="status" aria-live="polite">{{__('main.show')}}
                {{$data["first_page"]}} {{__('main.to')}} {{$data["last_page"]}} {{__('main.from')}} {{$data["count"]}}
                {{__('main.record')}}
            </div>
        </div>


        @if($data["count"]>$data['limit'])
            <div class="">
                <div class="dataTables_paginate paging_full_numbers" id="m_table_1_paginate">
                    <div class="">
                        <div class="dataTables_paginate paging_full_numbers" id="m_table_1_paginate">
                            <nav>
                                <ul class="pagination">

                                    <li class="page-item {{($data["page"]==1)?'disabled':''}}" aria-disabled="true"
                                        aria-label="« السابق">
                                        <a class="page-link"
                                           href="{!!url('reports/stock_receipt_report')!!}?page={{$data["page"]-1}}"
                                           rel="next" aria-label="السابق ‹‹">‹</a>

                                    </li>

                                    @for($i=1; $i<=round($data["pages"]); $i++)
                                        @if($i==$data["page"])
                                            <li class="page-item active" aria-current="page"><span
                                                    class="page-link">{{$data["page"]}}</span></li>
                                        @else
                                            <li class="page-item"><a class="page-link"
                                                                     href="{!!url('reports/stock_receipt_report')!!}?page={{$i}}">{{$i}}</a>
                                            </li>

                                        @endif
                                    @endfor


                                    <li class="page-item {{($data["page"]==round($data["pages"]))?'disabled':''}}">
                                        <a class="page-link"
                                           href="{!!url('reports/stock_receipt_report')!!}?page={{$data["page"]+1}}"
                                           rel="next" aria-label="التالي »">›</a>
                                    </li>
                                </ul>
                            </nav>

                        </div>
                    </div>
                </div>
            </div>
        @endif


        <div class="">
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
    </div>



@endif
