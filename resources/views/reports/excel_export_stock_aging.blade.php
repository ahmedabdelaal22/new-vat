<!DOCTYPE html>
<html lang="ar"  dir="{{app()->getLocale()=="ar"?"rtl":"ltr"}}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<table>
    <thead>

    @php

    $year = '2020';
    $dates_array = getReportDatesArray($year);
    @endphp
 

    <tr>
    <th>#</th>
    <th style="width: 100px;min-width: 100px;">{{trans('main.item_name')}}</th>
    <th style="width: 100px;min-width: 100px;">{{trans('main.unit_price')}}</th>
  


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
          <th></th>
    <th style="width: 100px;min-width: 100px;"></th>
    <th style="width: 100px;min-width: 100px;"></th>
  
        @for ($i = 0; $i < count($dates_array); $i++)
            <th class="text-center" width="4%">
                {{trans("main.amount")}}
            </th>
            <th class="text-center" width="4%">
                {{trans("main.price")}}
            </th>
        @endfor
    </tr>
    </thead>
    <tbody>
    @foreach($data as $row)
        <tr>
            @foreach ($row as $value)
                <td  width="25">{{ $value }}</td>
            @endforeach
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>
