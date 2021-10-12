<!DOCTYPE html>
<html {{(app()->getLocale() == 'ar') ? ' lang="ar" dir="rtl" ' :  ' lang="en" dir="ltr" ' }}>
<!-- begin::Head -->
<head>
    <meta charset="utf-8"/>
    <title> {{trans('main.crm')}} || {{trans('main.payments')}}</title>
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
          <div class="to">{{__('main.code')}} : </div>
          <h2 class="name">{{$resource->code}}</h2>

          <div class="address">{{__('main.date')}} : {{$resource->date}}</div>
            
        </div>
       



        <div id="invoice">
          <h1>{{trans('main.payments')}}</h1>
          <div class="date">{{__('main.supplier')}}: {{optional($resource->supplier)->name}}</div>
          <div class="date">{{__('main.money_amount')}} : {{$resource->amount}}</div>
        </div>




      </div>
     
        <div>  {!! $resource->notes !!}</div>
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

<script type="text/javascript">
    window.print();
</script>
<!-- end:: Page -->
</body>
<!-- end::Body -->
</html>  