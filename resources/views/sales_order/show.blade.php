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
                <div class="d-flex btn_con">
                @if(Auth()->user()->is_super_admin ||
                         Auth()->user()->can($basicRoute.' print')
                         )
                    <a href="{!!route($basicRoute.'.print',$resource->id)!!}" class="base_btn">
                        <span>
                            <i class="fa fa-print"></i>
                            <span>{{trans('main.print')}}</span>
                        </span>
                    </a>
                @endif
                @if(Auth()->user()->is_super_admin ||
                         Auth()->user()->can('sales invoices create')
                         )
                    <a href="{!!route('sales_invoices.create',['sales_order_id'=>$resource->id])!!}" class=" base_btn">
                        <span>
                            <i class="fa fa-shopping-cart"></i>
                            <span>{{trans('main.convert_to_sales_invoices')}}</span>
                        </span>
                    </a>
                @endif
                </div>
        </div>

    </div>
    <div class="m-portlet__body ">
        <div class="row">
        	<div class="col-md-4 form-group">
        		<label>{{__('main.code')}} : </label>
        		<label>{{$resource->code}}</label>
        	</div>

        	<div class="col-md-4 form-group">
        		<label>{{__('main.date')}} : </label>
        		<label>{{$resource->date}}</label>
        	</div>

        	<div class="col-md-4 form-group">
        		<label>{{__('main.confirmed_at')}} : </label>
        		<label>{{$resource->confirmed_at}}</label>
        	</div>

        	<div class="col-md-4 form-group">
        		<label>{{__('main.client')}} : </label>
        		<label>{{optional($resource->client_user)->name}}</label>
        	</div>
        	<div class="col-md-4 form-group">
        		<label>{{__('main.inventory')}} : </label>
        		<label>{{optional($resource->inventory)->name}}</label>
        	</div>
            <div class="col-md-4 form-group">
                <label>{{__('main.total')}} : </label>
                <label>{{$resource->total}}</label>
            </div>

            <div class="col-md-4 form-group">
                <label>{{__('main.discount')}} : </label>
                <label>{{$resource->discount}}</label>
            </div>


            <div class="col-md-4 form-group">
                <label>{{__('main.total_after_discount')}} : </label>
                <label>{{$resource->total_after_discount}}</label>
            </div>


            <div class="col-md-4 form-group">
                <label>{{__('main.final_total')}} : </label>
                <label>{{$resource->final_total}}</label>
            </div>
        	<div class="col-md-12 form-group">
                <div class="table-responsive">
        		<table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
                    <thead>
                        <th style="width: 150px!important">
                            {{__('main.item')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.amount')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.sales_price')}}
                        </th>

                        <th style="width: 111px!important">
                            {{__('main.total')}}
                        </th>
                        <th style="width: 111px!important">
                            {{__('main.notes')}}
                        </th>
                    </thead>
                    <tbody>
                    	@foreach($resource->items as $item)
                    		<tr>
                    			<td>{{optional($item->item)->name}}</td>
                    			<td>{{$item->amount}}</td>
                    			<td>{{$item->price}}</td>
                    			<td>{{$item->amount * $item->price}}</td>
                    			<td>{{$item->notes}}</td>
                    		</tr>
                		@endforeach
                    </tbody>

                </table>
            </div>
        	</div>

            <div class="col-md-12 form-group">
                {!! $resource->notes !!}
            </div>

        </div>
    </div>
</div>

 @endsection
@section('scripts')
<script type="text/javascript">

</script>

@endsection
