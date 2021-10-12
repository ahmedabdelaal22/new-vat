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

 
 
<table class="pdf_table">
    <thead>
    <tr>
        @foreach($data[0] as $key => $value)
            <th style="width: 150px; padding: 10px 0px; background-color: #f5f5f5">{{ trans("main.".($key) )}}</th>
        @endforeach
    </tr>
    </thead>
    <tbody>
    @foreach($data as $row)
        <tr>
            @foreach ($row as $value)
                <td style="text-align: right;padding: 5px 5px;">{{ $value }}</td>
            @endforeach
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>
