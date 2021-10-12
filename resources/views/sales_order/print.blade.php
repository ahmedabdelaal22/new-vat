<!DOCTYPE html>
<html {{(app()->getLocale() == 'ar') ? ' lang="ar" dir="rtl" ' :  ' lang="en" dir="ltr" ' }}>
<!-- begin::Head -->
<head>
    <meta charset="utf-8"/>
    <title> {{trans('main.crm')}} || {{trans('main.purchase_invoice')}}</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="description" content="Blank inner page examples">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <!--begin::Web font -->


    @include('layouts.styles')
    @include('layouts.print_invoice_style')

</head>
<!-- end::Head -->
<!-- begin::Body -->
<body class="f_ar">
<!-- begin:: Page -->
<br>
<header class="">
  <div id="company">
    <h2 class="name">Company Name</h2>
    <div>455 Foggy Heights, AZ 85004, US</div>
    <div>(602) 519-0450</div>
    <div>
      <a href="mailto:company@example.com">company@example.com</a>
    </div>
  </div>
  <div id="logo">
    <img class="logo_img" src="{!!url('dashboard')!!}/images/logo1_720.png">
  </div>
</header>
    <main>
      <div id="details" class="clearfix">
        <div id="client">
          <div class="to">{{trans('main.invoice_to')}} : </div>
          <h2 class="name">{{optional($resource->client_user)->name}}</h2>
          <div class="address">{{__('main.code')}} : {{$resource->code}}</div>
          <div class="email"><a href="mailto:{{optional($resource->client_user)->email}}">{{optional($resource->client_user)->email}}</a></div>
        </div>
        <div id="invoice">
          <h1>INVOICE</h1>
          <div class="date">{{__('main.confirmed_at')}} : {{$resource->confirmed_at}}</div>
          <div class="date">{{__('main.inventory')}} : {{optional($resource->inventory)->name}}</div>
        </div>
      </div>
      <table border="0" cellspacing="0" cellpadding="0" class="table-bordered">
        <thead>
          <tr>
            <th class="no">{{__('main.item')}}</th>
            <th class="desc" style="text-align: center;">{{__('main.amount')}}</th>
            <th class="unit">{{__('main.purchase_price')}}</th>
            <th class="qty">{{__('main.notes')}}</th>
            <th class="total">{{__('main.total')}}</th>
          </tr>
        </thead>
        <tbody>
        
          @foreach($resource->items as $item)
            <tr>
                <td class="no" style="text-align: center;">{{optional($item->item)->name}}</td>
                <td class="desc" style="text-align: center;">{{$item->amount}}</td>
                <td class="unit" style="text-align: center;">{{$item->price}}</td>
                <td class="qty" style="text-align: center;">{{$item->notes}}</td>
                <td class="total">{{$item->amount * $item->price}}</td>
            </tr>
          @endforeach
        </tbody>
        <tfoot>
          <tr>
            <td colspan="4">{{__('main.total')}}</td>
            <td>{{$resource->total}}</td>
          </tr>
          <tr>
            <td colspan="4">{{__('main.total_after_discount')}}</td>
            <td>{{$resource->total_after_discount}}</td>
          </tr>
          <tr>
            <td colspan="4">{{__('main.final_total')}}</td>
            <td>{{$resource->final_total}}</td>
          </tr>
        </tfoot>
      </table>
      <!-- <div id="thanks">Thank you!</div>
      <div id="notices">
        <div>NOTICE:</div>
        <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
      </div> -->
    </main>
    <footer>
      <!-- Invoice was created on a computer and is valid without the signature and seal. -->
    </footer>

<br><br><br><br><br><br>

<!-- <div class="m-grid m-grid--hor m-grid--root m-page">
<div class="m-portlet__body ">
        <div class="row">
        	<div class="col-md-12 form-group">
        		<label>{{__('main.code')}} : </label>
        		<label>{{$resource->code}}</label>
        	</div>

        	<div class="col-md-6 form-group">
        		<label>{{__('main.date')}} : </label>
        		<label>{{$resource->date}}</label>
        	</div>

        	<div class="col-md-6 form-group">
        		<label>{{__('main.confirmed_at')}} : </label>
        		<label>{{$resource->confirmed_at}}</label>
        	</div>

        	<div class="col-md-6 form-group">
        		<label>{{__('main.client')}} : </label>
        		<label>{{optional($resource->client_user)->name}}</label>
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
                <label>{{__('main.total_after_discount')}} : </label>
                <label>{{$resource->total_after_discount}}</label>
            </div>


            <div class="col-md-6 form-group">
                <label>{{__('main.final_total')}} : </label>
                <label>{{$resource->final_total}}</label>
            </div>
        	<div class="col-md-12 form-group">
        		
        		<table class="table table-striped- table-bordered dataTable table-hover table-checkable" id="InvoiceTableData">
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

            <div class="col-md-12 form-group">
                {!! $resource->notes !!}
            </div>

        </div>
    </div> -->
<script type="text/javascript">
    window.print();
</script>
<!-- end:: Page -->
</body>
<!-- end::Body -->
</html>

