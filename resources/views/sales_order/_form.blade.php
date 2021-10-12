<div class="m-portlet__body">
    <div class="form-group m-form__group row">

        <div class="col-lg-6">
            <label for="code">{!! trans('main.code') !!}</label>
            {!! Form::text('code',null,['class'=>'form-control
            m-input','id'=>'code','placeholder'=>trans('main.code')])!!}
        </div>
        <div class="col-lg-6">
            <label for="date">{!! trans('main.date') !!}</label>
            {!! Form::text('date',(!empty($resource->date) ? Carbon\Carbon::parse($resource->date)->format('Y/m/d') : Carbon\Carbon::now()->format('Y/m/d')),['class'=>'form-control
            m-input date-picker','autocomplete'=>'off','id'=>'date','placeholder'=>trans('main.date')])!!}
        </div>

        <div class="col-lg-6">

            <label for="supplier">{!! trans('main.client') !!}</label>
            {!! Form::select('client_id',App\Models\Client::
                    leftjoin('responsables as res', 'clients.id', '=', 'res.model_id')
                    ->where(function($q){  
                      if (Auth()->user() && !Auth()->user()->is_super_admin) { 
                                   $q ->where('res.model_type', '=', "App\\Models\\Client")
                                    ->where(function ($q) {
                                        $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                                        $q->where("res.employee_id", Auth()->user()->id);
                                        $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                                    })  ;
                            }
                    })
                   ->distinct()->select(["clients.*"])

           ->get()->pluck('name','id'),null,['class'=>'form-control
            m-input select2','id'=>'client_id','placeholder'=>trans('main.client')])!!}
        </div>

        <div class="col-lg-6">
            <label for="supplier">{!! trans('main.inventory') !!}</label>
            {!! Form::select('inventory_id',App\Models\Inventory::
                    leftjoin('responsables as res', 'inventories.id', '=', 'res.model_id')
                    ->where(function($q){  
                      if (Auth()->user() && !Auth()->user()->is_super_admin) { 
                                   $q ->where('res.model_type', '=', "App\\Models\\Inventory")
                                    ->where(function ($q) {
                                        $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                                        $q->where("res.employee_id", Auth()->user()->id);
                                        $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                                    })  ;
                            }
                    })
                   ->distinct()->select(["inventories.*"])


                   ->get()->pluck('name','id'),null,['class'=>'form-control
            m-input select2','id'=>'inventory_id','placeholder'=>trans('main.inventory')])!!}
        </div>
  

    </div>


    <div class="form-group m-form__group">
        <table class="table table-striped- table-bordered dataTable table-hover table-checkable" id="InvoiceTableData">
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
                    {{__('main.unit_price')}}
                </th>
                <th style="width: 111px!important">
                    {{__('main.purchase_price')}}
                </th>
                <th style="width: 111px!important">
                    {{__('main.total')}}
                </th>
                <th style="width: 111px!important">
                    {{__('main.notes')}}
                </th>
                <th style="width: 50px!important">
                    {{__('main.delete')}}
                </th>
            </thead>
            <tbody>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="8">
                        <button class="btn btn-success btn-sm" id="addTableRow">
                            <i class="fa fa-plus"></i>
                        </button>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
    <div class="form-group m-form__group row">
        <div class="col-lg-4">
            <label for="total">{!! trans('main.total') !!}</label>
            {!! Form::text('total',(!empty($resource->total)) ? $resource->total : 0,['class'=>'form-control
            m-input','id'=>'total','placeholder'=>trans('main.total'),'readonly'])!!}
        </div>


        <div class="col-lg-4">
            <label for="discount_type">{!! trans('main.discount_type') !!}</label>
            {!! Form::select('discount_type',['percent'=>trans('main.percent').' % ','fixed'=>trans('main.fixed_amount')],null,['class'=>'form-control
            m-input ','id'=>'discount_type'])!!}
        </div>
        <div class="col-lg-4">
            <label for="paid_amount">{!! trans('main.discount_amount') !!}</label>
            {!! Form::text('discount_amount',(!empty($resource->discount_amount)) ? $resource->discount_amount : 0,['class'=>'form-control
            m-input calculateTotal','id'=>'discount_amount','placeholder'=>trans('main.discount_amount')])!!}
        </div>



        <div class="col-lg-6">
            <label for="total_after_discount">
                {!! trans('main.total_after_discount') !!}
            </label>
            {!! Form::text('total_after_discount',(!empty($resource->total_after_discount)) ? $resource->total_after_discount : 0,['class'=>'form-control
            m-input','id'=>'total_after_discount','placeholder'=>trans('main.total_after_discount'),'readonly'])!!}
        </div>
        <div class="col-lg-6">
            <label for="final_total">
                {!! trans('main.final_total') !!}
            </label>
            {!! Form::text('final_total',(!empty($resource->final_total)) ? $resource->final_total : 0,['class'=>'form-control
            m-input','id'=>'final_total','placeholder'=>trans('main.final_total'),'readonly'])!!}
        </div>
    </div>

     <div class="col-lg-12">
        <label for="name">{!! trans('main.responsables') !!}</label>
        {!! Form::select('responsables[]',App\Models\User::
            where(function($q){
             if(!Auth()->user()->is_super_admin){
                    $q->where("team_leader_id",Auth()->user()->id);
                    $q->orWhere("manager_id",Auth()->user()->id);
                    $q->orWhere("id",Auth()->user()->id);
                }

            })->    
            get()->pluck('name','id'),$resource->responsables(),['class'=>'form-control
        m-input select2','multiple','id'=>'phones'])!!}
    </div>


    <div class="form-group m-form__group row">
        <div class="col-lg-12">
            <label for="notes">{!! trans('main.notes') !!}</label>
            {!! Form::textarea('notes',null,['class'=>'form-control
            m-input','id'=>'notes','placeholder'=>trans('main.notes'),'rows'=>3])!!}
        </div>
    </div>
</div>
@section('scripts')
<script type="text/javascript">
    @if (!empty($resource->items))
        @foreach($resource->items as $item)
            $('#InvoiceTableData tbody').append(tableRow({!!$item !!}));
        @endforeach
        calculateTotal();

    @else
        $('#InvoiceTableData tbody').append(tableRow());
        // $('.select2').select2();
    @endif

    $(document).on('click','#addTableRow',function(e){
        e.preventDefault();
         var inventorty_id=$("#inventory_id").val();

         if(inventorty_id==''){
            $.confirm({
                    title: "{{trans('main.please_choose_inventory')}}",
                    content: "{{trans('main.please_choose_inventory')}}",
                    type: 'red',
                    buttons: {
                        cancel:{
                            text: "{{trans('main.ok')}}",
                            btnClass: 'btn-success'
                        }
                    }
                });
         }else{

                $('#InvoiceTableData tbody').append(tableRow());
                $('.select2').select2();
         }


    });

    $(document).on('click','.deleteRecord',function (e){
        e.preventDefault();
        $(this).closest('tr').remove();
        calculateTotal();
    });

     $(document).on('change','.calculateTotal',function(){
        if (!$.isNumeric($(this).val())) {
            $(this).val('0');
        }
        calculateTotal();
    });
    $(document).on('change','#inventory_id',function(){
        $('#InvoiceTableData > tbody  > tr').each(function(index, tr) {
            $(this).closest('tr').remove();
        });
        calculateTotal();
    });
    $(document).on('change','#payment_type',function(){
        // console.log('dddddddddd');
        calculateTotal();
    });


    $(document).on('change','.item',function (e){

        e.preventDefault();


        itemOptions = JSON.parse($(this).find('option:selected').attr('data-options'));
        // console.log(itemOptions.purchase_price);

        item_amoun=$(this).find('option:selected').attr('data-amount');

        var purchasePrice = $(this).parents('tr').find('input[name="invoice_items[purchase_price][]"]');
        var salePrice = $(this).parents('tr').find('input[name="invoice_items[sale_price][]"]');
        var unitPrice = $(this).parents('tr').find('input[name="invoice_items[unit_price][]"]');
        var amount = $(this).parents('tr').find('input[name="invoice_items[amount][]"]');
        var total = $(this).parents('tr').find('input[name="invoice_items[total][]"]');

        if ($(this).find('option:selected').attr('data-options') !== undefined && $(this).find('option:selected').attr('data-options') !== '') {

            if(purchasePrice.length > 0 && purchasePrice.val() != ''){
                purchasePrice.val(itemOptions.purchase_price);
            }

            if(salePrice.length > 0 && salePrice.val() != ''){
                salePrice.val(itemOptions.sale_price);
            }

            if(unitPrice.length > 0 && unitPrice.val() != ''){
                unitPrice.val(itemOptions.unit_price);
            }

        }
        amount.prop('max',item_amoun);
        amount.prop('min',1);
        calculateTotal();


    });


    function calculateTotal(){

        var total = 0;

        $('#InvoiceTableData > tbody  > tr').each(function(index, tr) {

            var item = $(this).find('select[name="invoice_items[item_id][]"]').find('option:selected').val();

            var amount = $(this).find('input[name="invoice_items[amount][]"]').val();
            var purchasePrice = $(this).find('input[name="invoice_items[purchase_price][]"]').val();

            var salePrice = $(this).find('input[name="invoice_items[sale_price][]"]').val();


            var unitPrice = $(this).find('input[name="invoice_items[unit_price][]"]').val();
            // console.log(item);
            if (item !== undefined && item !== '') {

                var rowTotal = parseFloat(amount) * parseFloat(purchasePrice);

                if(!isNaN(rowTotal)){

                    total = parseFloat(total) + parseFloat(rowTotal);

                    $(this).find('input[name="invoice_items[total][]"]').val(rowTotal);
                }

            }


        });


        setTotals(total);

    }

    function setTotals(total){

        if(!isNaN(total)){
            $('#total').val(total);
        }

        var discountType = $('#discount_type').val();
        var discountAmount = $('#discount_amount').val();
        var discount = discountAmount ;
        if (discountType == 'percent') {
            discount = (parseFloat(discountAmount) * parseFloat(total)) / 100 ;
        }

        var totalAfterDiscount = parseFloat(total) - parseFloat(discount);

        if(!isNaN(totalAfterDiscount)){
            $('#total_after_discount').val(totalAfterDiscount);
        }


        var finalTotal = totalAfterDiscount;

        if(!isNaN(finalTotal)){

            $('#final_total').val(finalTotal);

            if ($('#payment_type').val() == 'cash') {
                $('#paid_amount').attr('readonly',true);
                $('#paid_amount').val(finalTotal);
            }else{
                $('#paid_amount').attr('readonly',false);
            }
        }


        var paidAmount = $('#paid_amount').val();

        if (!isNaN(paidAmount)) {

            var remainingAmount = parseFloat(finalTotal) - parseFloat(paidAmount);

            if (!isNaN(remainingAmount)) {
                $('#remaining_amount').val(remainingAmount);
            }
        }

    }

    function tableRow(row = null){
        var amount = 0 ,
            total = 0,
            purchase_price = 0 ,
            sale_price = 0,
            unit_price = 0,
            notes = '',
            item_id = '';

        if (row != null) {
            // console.log(row);
            item_id = row.item_id;
            total = row.total;
            purchase_price = row.price;
            sale_price = row.sale_price;
            unit_price = row.unit_price;
            amount = row.amount;
            notes = row.notes;
        }

        var item_input = itemInput(item_id);

        var rowHtml = '<tr>'
                        +'<td>'
                        + item_input
                        +'</td>'
                        +'<td>'
                        +'<input  name="invoice_items[amount][]" type="number" class="form-control calculateTotal" value="'+amount+'">'
                        +'</td>'
                        +'<td>'
                        +'<input  name="invoice_items[sale_price][]" type="text" class="form-control calculateTotal" value="'+sale_price+'">'
                        +'</td>'
                        +'<td>'
                        +'<input readonly name="invoice_items[unit_price][]" type="text" class="form-control calculateTotal" value="'+unit_price+'">'
                        +'</td>'
                        +'<td>'
                        +'<input readonly name="invoice_items[purchase_price][]" type="text" class="form-control calculateTotal" value="'+purchase_price+'">'
                        +'</td>'
                        +'<td>'
                        +'<input readonly name="invoice_items[total][]" type="text" class="form-control " value="'+total+'">'
                        +'</td>'
                        +'<td>'
                        +'<input  name="invoice_items[notes][]" type="text" class="form-control" value="'+notes+'">'
                        +'</td>'
                        +'<td>'
                        +'<button class="btn btn-sm btn-danger deleteRecord"><i class="fa fa-trash"></i></button>'
                        +'</td>'
                    +'</tr>';

        return rowHtml;
    }

    function itemInput(selectedOption = ''){
        var inventorty_id=$("#inventory_id").val();

        // var input = '<select  name="invoice_items[item_id][]" class="form-control m-input select2 item" style="width:100% !important">';

        // input += '<option selected></option>';

        // $.each(options,function(index,option){
        //     var selected = '';
        //     if (selectedOption == option.id) {
        //         selected = 'selected';
        //     }

        //     // console.log(JSON.stringify(option));

        //     input += '<option '+selected+' value="'+option.id+'" data-options=\''+JSON.stringify(option)+'\'>'+option.name+'</option>';
        // });

        // input += '</select>';

        // return input;

        var route = "{!! url('ajax_json_item') !!}/"+inventorty_id;
        var input = '<select  name="invoice_items[item_id][]" class="form-control m-input select2 item" >';

        input += '<option selected></option>';
        $.ajax({
                type: "Get",
                url: route,
                async: false,
                data: {inventorty_id: inventorty_id},
                dataType: 'json', // Define data type will be JSON
                success: function (result) {
                    var    options=result;
                    $.each(options,function(index,option){
                        var selected = '';
                        if (selectedOption == option.formitem.id) {
                            selected = 'selected';
                        }


                        input += '<option '+selected+' value="'+option.formitem.id+'" data-options=\''+JSON.stringify(option.formitem)+'\' data-amount=\''+option.amount+'\'>'+option.formitem.name+'</option>';
                    });

                   },
                error: function (error) {
                    $("#ajaxResponse").append("<div>" + error + "</div>");
                }
            });
            input += '</select>';

return input;


    }


</script>
@endsection
