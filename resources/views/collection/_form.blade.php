<div class="m-portlet__body">
    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="suppplier_id">{!! trans('main.client') !!}</label>
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

            ->get()->pluck('client_balnce','id'),null,['class'=>'form-control
            m-input m-input select2','id'=>'client_id','placeholder'=>trans('main.client')])!!}
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
            <label for="collection_items">{!! trans('main.sales_invoices') !!}</label>
            {!! Form::select('collection_items[]',get_salseinvoice(@$resource->client_id),all_collection_items(@$resource->id),['class'=>'form-control
            m-input m-input select2','id'=>'collection_items','multiple'])!!}
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
    $(document).on('change','#client_id',function(e){
        
        console.log("test");

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax(
        {
            url: "{!! url('get_client_salse_invoices/')!!}"+'?client_id='+$(this).val(),
            type: 'GET', // replaced from put
            acync:true,
            
            success: function (response)
            {
                if (response.status == 1) {
                    $('#collection_items').children().remove();
                    $.each(response.data,function(index,item){
                        $('#collection_items').append('<option value="'+item.id+'">'+item.code+'</option>');
                    });   
                }
            },
            error: function(xhr) {
                
           }
        });
    });
    
</script>
@endsection