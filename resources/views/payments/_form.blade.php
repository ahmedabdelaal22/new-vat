<div class="m-portlet__body">
    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="suppplier_id">{!! trans('main.supplier') !!}</label>
            {!! Form::select('supplier_id',App\Models\Supplier::


                  leftjoin('responsables as res', 'suppliers.id', '=', 'res.model_id')
                    ->where(function($q){  
                      if (Auth()->user() && !Auth()->user()->is_super_admin) { 
                                   $q ->where('res.model_type', '=', "App\\Models\\Supplier")
                                    ->where(function ($q) {
                                        $query_result = \Illuminate\Support\Facades\DB::Select("select id from users where manager_id=" . Auth()->user()->id . " or team_leader_id=" . Auth()->user()->id);

                                        $q->where("res.employee_id", Auth()->user()->id);
                                        $q->orWhereIn("res.employee_id", json_decode(json_encode($query_result), true));
                                    })  ;
                            }
                    })
                   ->distinct()->select(["suppliers.*"])->   


            get()->pluck('supplier_balnce','id'),null,['class'=>'form-control
            m-input m-input select2','id'=>'supplier_id','placeholder'=>trans('main.supplier')])!!}
        </div>

        <div class="col-lg-6">
            <label for="date">{!! trans('main.date') !!}</label>
            {!! Form::text('date',(!empty($resource->date) ? Carbon\Carbon::parse($resource->date)->format('Y/m/d') : Carbon\Carbon::now()->format('Y/m/d')),['class'=>'form-control
            m-input date-picker','autocomplete'=>'off','id'=>'date','placeholder'=>trans('main.date')])!!}
        </div>

    </div>

    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="amount">{!! trans('main.money_amount') !!}</label>
            {!! Form::text('amount',null,['class'=>'form-control
            m-input','id'=>'amount','placeholder'=>trans('main.money_amount')])!!}
        </div>

        <div class="col-lg-6">
            <label for="payment_items">{!! trans('main.purchase_invoices') !!}</label>
            {!! Form::select('payment_items[]',get_purchase_invoices(@$resource->supplier_id),all_purchase_invoices(@$resource->id),['class'=>'form-control
            m-input m-input select2','id'=>'payment_items','multiple'])!!}
        </div>

    </div>

    <div class="form-group m-form__group row">
        <div class="col-lg-12">
            <label for="notes">{!! trans('main.notes') !!}</label>
            {!! Form::textarea('notes',null,['class'=>'form-control
            m-input','id'=>'notes','placeholder'=>trans('main.notes')])!!}
        </div>
    </div>
  

</div>
@section('scripts')
<script type="text/javascript">
    $(document).on('change','#supplier_id',function(e){
        
        console.log();

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax(
        {
            url: "{!! url('get_supplier_purchase_invoices/')!!}"+'?supplier_id='+$(this).val(),
            type: 'GET', // replaced from put
            acync:true,
            
            success: function (response)
            {
                if (response.status == 1) {
                    $('#payment_items').children().remove();
                    $.each(response.data,function(index,item){
                        $('#payment_items').append('<option value="'+item.id+'">'+item.code+'</option>');
                    });   
                }
            },
            error: function(xhr) {
                
           }
        });
    });
    
</script>
@endsection