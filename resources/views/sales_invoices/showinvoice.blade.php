@extends('layouts.app')
@section('title') {{trans('main.'.$basicRoute)}} @endsection
@section('header')@endsection
@section('breadcrumb')
    @php($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute.'.index'),])
    @includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')

    <div class="m-portlet m-portlet--mobile">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <h3 class="m-portlet__head-text">
                        {{trans('main.'.$basicRoute)}}
                    </h3>
                </div>
            </div>

            <div class="m-portlet__head-tools">
                <ul class="m-portlet__nav">

                    @if($data->validationResults->status == 'Invalid')

                        <li class="m-portlet__nav-item">
                            <a href="{!!route($basicRoute.'.edit',$data->internalId)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                               data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                                <i class="la la-edit"></i>
                            </a>
                        </li>
     
                    @else
                        <li class="m-portlet__nav-item">
                            <a href="{!!route($basicRoute.'.print',$data->internalId)!!}" class="m-portlet__nav-link btn m-btn
                        m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                               data-placement="top" title="" data-original-title="{{__('main.print')}}" target="_blank">
                                <i class="la la-print"></i>
                            </a>
                        </li>
                    @endif
                    <li class="m-portlet__nav-item"></li>

                </ul>
            </div>

        </div>
        <div class="m-portlet__body ">
            <div class="row">
           
            <div class="col-md-6 form-group">
                    <label>{{__('main.status')}} : </label>
                    <label>{{$data->validationResults->status}}</label>
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('main.typeName')}} : </label>
                    <label>{{$data->typeName}}</label>
                </div>

                <div class="col-md-6 form-group">
                    <label>{{__('main.dateTimeIssued')}} : </label>
                    <label>{{$data->dateTimeIssued}}</label>
                </div>

                <div class="col-md-6 form-group">
                    <label>{{__('main.totalSales')}} : </label>
                    <label>{{$data->totalSales}}</label>
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('main.totalDiscount')}} : </label>
                    <label>{{$data->totalDiscount}}</label>
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('main.netAmount')}} : </label>
                    <label>{{$data->netAmount}}</label>
                </div>

                <div class="col-md-6 form-group">
                    <label>{{__('main.total')}} : </label>
                    <label>{{$data->total}}</label>
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('main.receiverId')}} : </label>
                    <label>{{$data->receiverId}}</label>
                </div>

                <div class="col-md-6 form-group">
                    <label>{{__('main.receiverName')}} : </label>
                    <label>{{$data->receiverName}}</label>
                </div>


                <div class="col-md-12 form-group">

                    <table class="table table-striped- table-bordered dataTable table-hover table-checkable"
                           id="InvoiceTableData">
                        <thead>
                        <th style="width: 150px!important">
                            {{__('main.description')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.itemType')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.itemCode')}}
                        </th>

                        <th style="width: 111px!important">
                            {{__('main.unitType')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.salesTotal')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.totalTaxableFees')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.discount')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.netTotal')}}
                        </th>

                        <th style="width: 111px!important">
                            {{__('main.total')}}
                        </th>
                        </thead>

                        
                        <tbody>
                        @if($data->document)
                        <?php 
                       $invoiceLines= json_decode($data->document)->invoiceLines;
                        ?>
                            @foreach($invoiceLines as $item)
                                <tr>
                                    <td>{{$item->description}}</td>
                                    <td>{{$item->itemType}}</td>
                                    <td>{{$item->itemCode}}</td>
                                    <td>{{$item->unitType}}</td>
                                    <td>{{$item->salesTotal}}</td>
                                     <td>{{$item->totalTaxableFees}}</td>
                                    <td>{{$item->discount->amount}}</td>
                                    <td>{{$item->netTotal}}</td>
                                    <td>{{$item->total}}</td>
                            
                          
                                </tr>
                            @endforeach
                        @endif
                        </tbody>

                    </table>

                </div>

             

                <div class="col-md-12 form-group">
                    <label>{{__('main.taxes')}}</label>
                    <table class="table table-striped- table-bordered dataTable table-hover table-checkable"
                           id="InvoiceInstallmentTableData">
                        <thead>
                        <th>
                            {{__('main.taxType')}}
                        </th>

                        <th>
                            {{__('main.amount')}}
                        </th>



                        </thead>
                        <tbody>
                            <?php 
                            $taxTotals= json_decode($data->document)->taxTotals;
                            ?>
                        @if($taxTotals)
                            @foreach($taxTotals as $tax)
                                <tr>
                                    <td>
                                   {{$tax->taxType}}
                                    </td>
                                    <td>
                                    {{$tax->amount}}
                                    </td>
                                
                                </tr>
                            @endforeach
                        @endif
              
                        </tbody>

                    </table>
                </div>


                <div class="col-md-12 form-group">
                    <label>{{__('main.validationSteps')}}</label>
                    <table class="table table-striped- table-bordered dataTable table-hover table-checkable"
                           id="InvoiceInstallmentTableData">
                        <thead>
                        <th>
                            {{__('main.name')}}
                        </th>

                        <th>
                            {{__('main.status')}}
                        </th>



                        </thead>
                        <tbody>
                            <?php 
                            $validationSteps=$data->validationResults->validationSteps;
                            ?>
                        @if($validationSteps)
                            @foreach($validationSteps as $step)
                                <tr>
                                    <td>
                                   {{$step->name}}
                                    </td>
                                    <td>
                                    {{$step->status}}
                                    @if($step->status == 'Invalid')
                                    @foreach($step->error->innerError as $er)
                                    <tr>
                                    <td>  {{$er->propertyPath}}</td>
                                    <td>  {{$er->errorCode}}</td>
                                    <td>  {{$er->error}}</td>
                                     </tr>
                                    @endforeach
                                    @endif
                                    </td>
                                
                                </tr>
                            @endforeach
                        @endif
              
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>

@endsection
@section('scripts')
    <script type="text/javascript">

    </script>

@endsection
