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

                    @if('status' == 'new')
                        <li class="m-portlet__nav-item">
                            <a href="{!!route($basicRoute.'.approve',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                               data-placement="top" title="" data-original-title="{{__('main.approve')}}">
                                <i class="la la-check"></i>
                            </a>
                        </li>
                        <li class="m-portlet__nav-item">
                            <a href="{!!route($basicRoute.'.edit',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                               data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                                <i class="la la-edit"></i>
                            </a>
                        </li>
                        <li class="m-portlet__nav-item">

                            <button
                                class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy"
                                data-toggle="m-tooltip" data-placement="top" title=""
                                data-original-title="{{__('main.delete')}}"
                                data-route="{!!route($basicRoute.'.destroy',$resource->id)!!}" data-token="">
                                <i class="la la-trash"></i>
                            </button>
                        </li>
                    @else
                        <li class="m-portlet__nav-item">
                            <a href="{!!route($basicRoute.'.print',$resource->id)!!}" class="m-portlet__nav-link btn m-btn
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
                    <label>{{__('main.code')}} : </label>
                    <label>{{$resource->code}}</label>
                </div>

                <div class="col-md-6 form-group">
                    <label>{{__('main.date')}} : </label>
                    <label>{{$resource->date}}</label>
                </div>

                <div class="col-md-6 form-group">
                    <label>{{__('main.client')}} : </label>
                    <label>{{optional($resource->client)->name}}</label>
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('main.inventory')}} : </label>
                    <label>{{optional($resource->inventory)->name}}</label>
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('main.total')}} : </label>
                    <label>{{$resource->total}}</label>
                </div>

                <div class="col-md-6 form-group">
                    <label>{{__('main.discount')}} : </label>
                    <label>{{$resource->discount}}</label>
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('main.total_taxes')}} : </label>
                    <label>{{$resource->total_taxes_amount}}</label>
                </div>

                <div class="col-md-6 form-group">
                    <label>{{__('main.total_after_discount')}} : </label>
                    <label>{{$resource->total_after_discount}}</label>
                </div>


                <div class="col-md-6 form-group">
                    <label>{{__('main.final_total')}} : </label>
                    <label>{{$resource->final_total}}</label>
                </div>
                <div class="col-md-12 form-group">

                    <table class="table table-striped- table-bordered dataTable table-hover table-checkable"
                           id="InvoiceTableData">
                        <thead>
                        <th style="width: 150px!important">
                            {{__('main.item')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.amount')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.sale_price')}}
                        </th>

                        <th style="width: 111px!important">
                            {{__('main.total')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.notes')}}
                        </th>
                        </thead>
                        <tbody>
                        @if($resource->items)
                            @foreach($resource->items as $item)
                                <tr>
                                    <td>{{optional($item->item)->name}}</td>
                                    <td>{{$item->amount}}</td>
                                    <td>{{$item->price}}</td>
                                    <td>{{$item->amount * $item->price}}</td>
                                    <td>{{$item->notes?$item->notes:"-"}}</td>
                                </tr>
                            @endforeach
                        @endif
                        </tbody>

                    </table>

                </div>

                <div class="col-md-12 form-group">
                    {!! $resource->notes !!}
                </div>

                <div class="col-md-12 form-group">
                    <label>{{__('main.installments')}}</label>
                    <table class="table table-striped- table-bordered dataTable table-hover table-checkable"
                           id="InvoiceInstallmentTableData">
                        <thead>
                        <th>
                            {{__('main.money_amount')}}
                        </th>

                        <th>
                            {{__('main.date')}}
                        </th>

                        <th>
                            {{__('main.notes')}}
                        </th>


                        </thead>
                        <tbody>
                        @if($resource->installments)
                            @foreach($resource->installments as $installment)
                                <tr>
                                    <td>
                                        {{$installment->amount}}
                                    </td>
                                    <td>
                                        {{$installment->date}}
                                    </td>
                                    <td>
                                        {{$installment->notes}}
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
