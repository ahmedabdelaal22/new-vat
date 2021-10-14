<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::auth();

Route::get('lang', function () {
    if (session()->has('lang') && session()->get('lang') == 'en') {
        session()->put('lang', 'ar');
    } else {
        session()->put('lang', 'en');
    }

    return back();
});

Route::get('not_allowed', function () {
    return view('not_allowed_page');
})->name('not_allowed');
use Illuminate\Support\Facades\Artisan;
Route::get('test', function () {

  
  Artisan::call("config:clear");


  Artisan::call('config:clear');
  Artisan::call('cache:clear');
  Artisan::call('cache:forget', ['key' => 'spatie.permission.cache']);
  Artisan::call('view:clear');
  Artisan::call('route:clear');
  dd("done");
    // $fb = new Facebook\Facebook([
    //     'app_id' => '386838335058604',
    //     'app_secret' => 'cb2c8114dcb28d8aa272618d18dbe0ee',
    //     'default_graph_version' => 'v2.3',
    // ]);

    // dd($fb->get('/818545878175274/posts', 'EAAFf09GL8qwBALgl666unyssfZA5LDZCxgQUFuZAJ74ojdrQHZC6qTkemsFILZApdtVQqGT3JMfgGxeHZBNthoQMY0GmKTl0xSE8RjZCjEOR6oJZBpNQGj1ZCZBmeEueAXsC52DZCPMZCBoaQeoEDWqD8HCKzZCk6447ZCims5AVBZAXLZCZBQB4z1Ow3XiU5McbjCXCGxskP3Ngxaf0dBQZDZD')->getBody());

});

Route::get('/create_admin', function () {
    App\Models\User::create(['name' => 'admin', 'is_super_admin' => 1, 'email' => 'admin@admin.com', 'password' => bcrypt('123456')]);
    return 'done';
});

Route::group(['middleware' => ['auth', 'language']], function () {

    Route::get('/', function () {
        return view('home');
    });

    Route::get('home', function () {
        return view('home');
    });

    Route::get('/', 'CalenderController@index')->name('calender.index');

    Route::get('/loginInvoice', 'CalenderController@loginInvoice')->name('loginInvoice');
    Route::get('/logoutInvoice', 'CalenderController@logoutInvoice')->name('logoutInvoice');

    
    Route::get('/ajax_json', 'CalenderController@ajax_json');

    Route::any('ajax_connection_way_status', 'ConnectionWayController@connection_way_status');

    Route::get('/ajax_json_item/{id}', 'SalesOrderController@ajax_json_item');

    Route::PUT('users/update_profile/{id}', 'UserController@update_profile')->name('users.update_profile');

    Route::PUT('users/update_photo/{id}', 'UserController@update_image')->name('users.update_photo');

    Route::resource('chats', 'ChatController');

    Route::group(['middleware' => ['create_permission', 'check_permission']], function () {


        Route::get('mailbox', 'MailBoxController@index')->name('mailbox.index');

        Route::resource('settings', 'SettingController');

        Route::resource('marketing_ways', 'MarketingWayController');

        Route::resource('client_categories', 'ClientCategoryController');

        Route::resource('contact_list', 'ContactListController');

        Route::post('contact_list/add_phones', 'ContactListController@addPhones')->name('contact_list.add_phones');

        Route::resource('connection_ways', 'ConnectionWayController');


        Route::resource('campaigns', 'CampaignController');

     

        Route::resource('sales_order', 'SalesOrderController');


        Route::get('sales_order/by_leads/{lead_id?}', 'SalesOrderController@lead_sales_orders')->name('sales_order.by_leads');

        Route::get('showajaxnotfication', 'CrudController@showajaxnotfication')->name('showajaxnotfication');

        Route::get('sales_order/confirem/{id}/', 'SalesOrderController@confirem')->name('sales_order.confirem');

        Route::get('sales_order/print/{id}', 'SalesOrderController@print')->name('sales_order.print');


        Route::resource('purchase_invoices', 'PurchaseInvoiceController');

        Route::get('purchase_invoices/approve/{id}', 'PurchaseInvoiceController@Approve')->name('purchase_invoices.approve');

        Route::get('purchase_invoices/print/{id}', 'PurchaseInvoiceController@print')->name('purchase_invoices.print');

        Route::resource('purchase_installments', 'PurchaseInstallmentController');


        Route::resource('collection', 'CollectionController');

        Route::get('collection/print/{id}', 'CollectionController@print')->name('collection.print');

        Route::get('collection/approve/{id}', 'CollectionController@approve')->name('collection.approve');

        Route::get('get_client_salse_invoices', 'CollectionController@getClientSalseInvoices')->name('get_client_salse_invoices');

        Route::resource('inventory_items', 'InventoryItemController');

        Route::resource('item_categories', 'ItemCategoryController');
        Route::post('item_categories/import', 'ItemCategoryController@import')->name('item_categories.import');

        Route::resource('purchase_invoices', 'PurchaseInvoiceController');

        Route::resource('item_categories', 'ItemCategoryController');

        Route::resource('items', 'ItemController');

        Route::resource('variations', 'VariationController');



        Route::resource('item_variations', 'ItemVariationController');

        Route::resource('suppliers', 'SupplierController');

        Route::resource('inventories', 'InventoryController');
        Route::post('inventories/import', 'InventoryController@import')->name('inventories.import');

        Route::resource('taxes', 'TaxeController');

        Route::resource('currency', 'CurrencyController');

        Route::resource('projects', 'ProjectController');

        Route::resource('departments', 'DepartmentController');

        Route::get('campaigncomments/create/{id}', 'CampaignCommentsController@create')->name('campaigncomments.create');

        Route::group(['namespace' => 'Reports'], function () {
            

            Route::get('reports/client_sales_order', 'ClientSalesOrderReportController@index')->name('reports/client_sales_order.index');
            Route::get('reports/client_sales_order/export_excel', 'ClientSalesOrderReportController@export_excel')->name('reports/client_sales_order.export_excel');
            Route::get('reports/client_sales_order/export_pdf', 'ClientSalesOrderReportController@export_pdf')->name('reports/client_sales_order.export_pdf');

            Route::get('reports/client_sales_invoice', 'ClientSalesInvoiceReportController@index')->name('reports/client_sales_invoice.index');
            Route::get('reports/client_sales_invoice/export_excel', 'ClientSalesInvoiceReportController@export_excel')->name('reports/client_sales_invoice.export_excel');
            Route::get('reports/client_sales_invoice/export_pdf', 'ClientSalesInvoiceReportController@export_pdf')->name('reports/client_sales_invoice.export_pdf');

            Route::get('reports/client_balances', 'ClientBalancesReportController@index')->name('reports/client_balances.index');
            Route::get('reports/client_balances/export_excel', 'ClientBalancesReportController@export_excel')->name('reports/client_balances.export_excel');
            Route::get('reports/client_balances/export_pdf', 'ClientBalancesReportController@export_pdf')->name('reports/client_balances.export_pdf');

   

            Route::get('reports/deals', 'DealsReportController@index')->name('reports/deals.index');
            Route::get('reports/deals/export_excel', 'DealsReportController@export_excel')->name('reports/deals.export_excel');
            Route::get('reports/deals/export_pdf', 'DealsReportController@export_pdf')->name('reports/deals.export_pdf');

            Route::get('reports/stock_receipt_report', 'StockReceiptReportController@index')->name('reports/stock_receipt_report.index');
            Route::get('reports/stock_receipt_report/export_excel', 'StockReceiptReportController@export_excel')->name('reports/stock_receipt_report.export_excel');
            Route::get('reports/stock_receipt_report/export_pdf', 'StockReceiptReportController@export_pdf')->name('reports/stock_receipt_report.export_pdf');

            Route::get('reports/stock_ageing_report', 'StockAgeingController@index')->name('reports/stock_ageing_report.index');
            Route::get('reports/stock_ageing_report/export_excel', 'StockAgeingController@export_excel')->name('reports/stock_ageing_report.export_excel');
            Route::get('reports/stock_ageing_report/export_pdf', 'StockAgeingController@export_pdf')->name('reports/stock_ageing_report.export_pdf');

        });

        Route::resource('campaigncomments', 'CampaignCommentsController');

        Route::resource('users', 'UserController');

        Route::get('profile', 'UserController@profile')->name('profile');


        Route::resource('notfications', 'NotificationController');

        Route::resource('roles', 'RoleController');

        Route::resource('role_permissions', 'RolePermissionController');

        Route::post('clients/update_phones', 'ClientController@updatePhones')->name('clients.update_phones');

        Route::resource('clients', 'ClientController');
        Route::post('clients/import', 'ClientController@import')->name('clients.import');

        Route::put('clients/update_show/{id}', 'ClientController@update_show')->name('clients.update_show');

        

        Route::resource('logs', 'LogsController');

        Route::resource('sales_invoices', 'SaleInvoiceController');
        Route::get('invoicesdk', 'InvoicesdkController@invoicesdk')->name('invoicesdk');
        Route::get('cancelinvoice/{id}', 'InvoicesdkController@cancelinvoice')->name('cancelinvoice');

        
        Route::get('sales_invoices/approve/{id}', 'SaleInvoiceController@Approve')->name('sales_invoices.approve');

        Route::get('sales_invoices/print/{id}', 'SaleInvoiceController@print')->name('sales_invoices.print');
        Route::get('sales_invoices/sdkinvoice/{id}', 'SaleInvoiceController@sdkinvoice')->name('sales_invoices.sdkinvoice');
        Route::get('sales_invoices/showinvoice/{id}', 'SaleInvoiceController@showinvoice')->name('sales_invoices.showinvoice');

        

        Route::get('sales_invoices/by_leads/{lead_id?}', 'SaleInvoiceController@lead_sales_invoices')->name('sales_invoices.by_leads');

        Route::resource('sales_invoices_installments', 'SalesInvoiceInstallmentController');


    });

    Route::get('chats_get_users_box', 'ChatController@getUsersBox')->name('chats.get_users_box');


    Route::post('/getAutoComplete', 'CrudController@getAutoComplete')->name('getAutoComplete');

});
