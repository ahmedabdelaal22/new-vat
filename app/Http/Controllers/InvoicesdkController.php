<?php

namespace App\Http\Controllers;

use App\Http\Requests\SaleInvoiceRequest;
use App\Models\Client;
use App\Models\Responsable;
use App\Models\SalesInvoice;
use App\Models\SalesInvoiceInstallment;
use App\Models\SalesInvoiceItem;
use App\Models\Tax;
use App\Models\SalesOrder;
use Illuminate\Http\Request;
use App\Models\PurchaseInvoice;
use App\Models\PurchaseInvoiceItem;
use App\Models\EInvoicingSDK;
use App\Models\InventoryItem;
use App\Models\SalesInvoiceTaxes;
use App\Models\PurchaseInstallment;
use App\Http\Requests\PurchaseInvoiceRequest;
use Illuminate\Support\Facades\DB;
use Exception;
use Carbon\Carbon;
use Symfony\Component\HttpFoundation\Session\Session;
use View;


class InvoicesdkController extends Controller
{

    public function __construct(Request $request)
    {
  
        $this->basicViewFolder = 'einvoicingsdk';
        $this->basicRoute = 'invoicesdk';
        $this->request = $request;
        view::share('basicRoute', $this->basicRoute);
        view::share('basicViewFolder', $this->basicViewFolder);

    }

public function invoicesdk(Request $request){
    $inv=new EInvoicingSDK();
    $url="/api/v1.0/documents/recent?PageSize=10&PageNo=".request('page');
    $data=$inv->getDoc($url);
    $resources=$data->result;
    $metadata['totalPages']=$data->metadata->totalPages;
    $metadata['page']= (request('page')) ? request('page') : 1;
    $i=0;
  //  print_r($resources);
    // foreach($resources as $row){
    //     $row=json_encode($row);
    //     print_r($row[0]['internalId']);

    // }
 //   die;
    //$resources=[];
    if (view()->exists($this->basicViewFolder . '.index')) {
        if ($request->ajax()) {
            return view($this->basicViewFolder . '._table', compact('resources','metadata'))->render();
        } else {
            return view($this->basicViewFolder . '.index', compact('resources','metadata'));
        }
    }

    return " the view " . $this->basicViewFolder . ".index not found";
}


public function cancelinvoice($uuid){
 
    $inv=new EInvoicingSDK();
    $url="/api/v1.0/documents/state/$uuid/state";
    $fields['status']="cancelled";
    $fields['reason']="some reason for cancelled document";
    $data=$inv->Putinv($url,$fields);
     
    return redirect()->route('invoicesdk');
  }

}
