<!DOCTYPE html>
<html lang="ar" dir="{{app()->getLocale()=="ar"?"rtl":"ltr"}}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<style>
   #logo {
      margin-top: 8px;
    }

    #logo img {
      height: 70px;
    }

    #company {
      text-align: left;
    }

    header {
      padding: 10px 0;
      margin-bottom: 20px;
      border-bottom: 1px solid #AAAAAA;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    table.pdf_table {
      border-collapse: collapse;
      table-layout: fixed;
    }
    table.pdf_table, th, td {
        border: 1px solid #000;
    }
    th, td {
        padding: 0px 5px;
    }
    table.pdf_table thead tr th:first-child {
        width: 100px!important;
        min-width: 100px!important;
        max-width: 100px!important;
    }
    table.pdf_table tbody tr td:first-child {
        width: 100px!important;
        min-width: 100px!important;
        max-width: 100px!important;
        text-align: right!important;
    }
</style>
<body>

        <header class="">
         

        <div  width="100%">
          <div id="company"  width="50%" style="float: left;">
            <h2 class="name">Company Name</h2>
            <div>455 Foggy Heights, AZ 85004, US</div>
            <div>(602) 519-0450</div>
            <div>
              <a href="mailto:company@example.com">company@example.com</a>
            </div>
          </div>

          <div id="logo" width="50%" style="float: right;">
            <img class="logo_img" src="{!!url('dashboard')!!}/images/logo1_720.png" width="100" height="100">
          </div>
          <br/>
            <div>{{trans("main.date")}}: {{date('Y-m-d')}}</div>

        </div> 

        </header>

 
   <div align="center">{{trans("main.".$basicRoute)}}</div>
  <br/>

    <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table report_ageing">
            <thead>
            <tr>
                <th>#</th>
                <th style="width: 100px;min-width: 100px;">{{trans('main.item_name')}}</th>
                <th style="width: 100px;min-width: 100px;">{{trans('main.unit_price')}}</th>
                <th class="text-center">
                    <table width="100%" class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
                        @php

                            $year = '2020';
                                $dates_array = getReportDatesArray($year);
                        @endphp

                        <tr>
                            @for ($i = 0; $i < count($dates_array); $i++)
                                <th colspan="2" class="text-center" width="8%">
                                    @if(app()->getLocale()=="ar")
                                        {{get_arabic_month(date("F", strtotime(  $dates_array[$i])))  }}
                                    @else
                                        {{date("F", strtotime(  $dates_array[$i]))}}

                                        @endif
                                </th>
                            @endfor
                        </tr>
                        <tr colspan="{{count($dates_array)}}">
                            @for ($i = 0; $i < count($dates_array); $i++)
                                <th class="text-center" width="4%">
                                    {{trans("main.amount")}}
                                </th>
                                <th class="text-center" width="4%">
                                    {{trans("main.price")}}
                                </th>
                            @endfor
                        </tr>


                    </table>
                </th>


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

            @foreach($data as $resource)
                <tr class="table_tr">
                    <td>{!!$loop->iteration!!}</td>
                    <td>{!! $resource->item_name!!}</td>
                    <td>{!! $resource->unit_price!!}</td>

                    <td>
                        <table width="100%" class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
                            @php
                                $year = '2020';
                              $dates_array = getReportDatesArray($year);
                            @endphp

                            <tr>
                                @for ($i = 0; $i < count($dates_array); $i++)
                                    <td align="center" width="4%">
                                        {{$resource->{"amount".$i} }}
                                    </td>
                                    <td align="center" width="4%">
                                        {{$resource->{"price".$i} }}
                                    </td>
                                @endfor
                            </tr>
                        </table>
                    </td>


                </tr>
            @endforeach

            </tbody>
        </table>
</body>
</html>
