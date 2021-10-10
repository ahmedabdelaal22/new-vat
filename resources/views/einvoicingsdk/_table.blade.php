<div class="row">

    <div class="col-sm-12">
        <div class="table-responsive">
            <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <!-- <th>
                  
                        {!! trans('main.publicUrl') !!}
                    </th> -->

                        <th>
                            {!! trans('main.status') !!}
                        </th>
                        <th>
                            {!! trans('main.uuid') !!}
                        </th>
                        <th>
                            {!! trans('main.internalId') !!}
                        </th>
                        <th>
                            {!! trans('main.typeName') !!}
                        </th>

                        <th>
                            {!! trans('main.receiverId') !!}
                        </th>

                        <th>
                            {!! trans('main.receiverName') !!}
                        </th>

                        <th>
                            {!! trans('main.dateTimeIssued') !!}
                        </th>
                        <th>
                            {!! trans('main.totalSales') !!}
                        </th>
                        <th>
                            {!! trans('main.totalDiscount') !!}
                        </th>
                        <th>
                            {!! trans('main.netAmount') !!}
                        </th>
                        <th>
                            {!! trans('main.total') !!}
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
                    <tr class="table_tr" id="removable{{$resource->internalId}}">
                        <td>{!!$loop->iteration!!}</td>
                        <td>{!!$resource->status!!}</td>
                        <!-- <td>{!!$resource->publicUrl!!}</td> -->

                        <td>{!!$resource->uuid!!}</td>
                        <td>{!!$resource->internalId!!}</td>
                        <td>{!!$resource->typeName!!}</td>


                        <td>{!!$resource->receiverId!!}</td>
                        <td>{!!$resource->receiverName!!}</td>
                        <td>{!!$resource->dateTimeIssued!!}</td>
                        <td>{!!$resource->totalSales!!}</td>






                        <td>{!!$resource->totalDiscount!!}</td>
                        <td>{!!$resource->netAmount!!}</td>
                        <td>{!!$resource->total!!}</td>

                        <td>




                            @if(!empty(session('generatedAccessToken')) && !empty($resource->uuid) )

                            <a href="{!!route('sales_invoices.showinvoice',$resource->uuid)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                data-placement="top" title="" data-original-title="{{__('main.viewsdkinvoice')}}">
                                <i class="fa fa-eye"></i>

                            </a>
                            <a href="{!!route('cancelinvoice',$resource->uuid)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                           data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                                            <i class="fa fa-edit"></i>
                             </a>
                            @endif


                        </td>

                    </tr>
                    @endforeach

                </tbody>
            </table>


            <nav>
                <ul class="pagination">
                    @if($metadata['page'] == 1 )
                    <li class="page-item disabled" aria-disabled="true" aria-label="« السابق">
                        <span class="page-link" aria-hidden="true">‹</span>
                    </li>
                    @else
                    <a class="page-link" href="{{url('invoicesdk')}}?page={{$metadata['page']-1}}" rel="prev" aria-label="« السابق">‹</a>
                  @endif
                  @for($i=1;$i < $metadata['totalPages']+1;$i++)

                  @if($i == $metadata['page'] )
                  <li class="page-item active" aria-current="page"><span class="page-link">{{$i}}</span></li>

                    @else
                    <li class="page-item"><a class="page-link" href="{{url('invoicesdk')}}?page={{$i}}">{{$i}}</a></li>
                    @endif
                   @endfor
                    @if($metadata['totalPages']==$metadata['page'] )
                    <li class="page-item disabled" aria-disabled="true" aria-label="التالي »">
                    <span class="page-link" aria-hidden="true">›</span>
                </li>

                    @else
                    <li class="page-item">
                        <a class="page-link" href="{{url('invoicesdk')}}?page={{$metadata['page']+1}}" rel="next"
                            aria-label="التالي »">›</a>
                    </li>

                    @endif
               
                </ul>
            </nav>
        </div>
    </div>
</div>
