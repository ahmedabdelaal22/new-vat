<div class="m-portlet__body">
    <div class="form-group m-form__group row">

        <div class="col-lg-12">
            <label for="category_id">{!! trans('main.parent_category') !!}</label>
            {!! Form::select('category_id',App\Models\ItemCategory::get()->pluck('name','id'),null,['class'=>'form-control
            m-input select2','id'=>'cetegory_id','placeholder'=>trans('main.category')])!!}
        </div>
    </div>

    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="itemCode">{!! trans('main.itemCode') !!}</label>
            {!! Form::text('itemCode',null,['class'=>'form-control
            m-input','id'=>'itemCode','placeholder'=>trans('main.itemCode')])!!}
        </div>
        <div class="col-lg-6">
            <label for="name_en">{!! trans('main.unitType') !!}</label>
            {!! Form::select('unitType',settingselect('unitType'),null,['class'=>'form-control
            m-input select2','id'=>'unitType','placeholder'=>trans('main.unitType')])!!}
        </div>
    </div>
    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="name_ar">{!! trans('main.name_ar') !!}</label>
            {!! Form::text('name_ar',null,['class'=>'form-control
            m-input','id'=>'name_ar','placeholder'=>trans('main.name_ar')])!!}
        </div>
        <div class="col-lg-6">
            <label for="name_en">{!! trans('main.name_en') !!}</label>
            {!! Form::text('name_en',null,['class'=>'form-control
            m-input','id'=>'name_en','placeholder'=>trans('main.name_en')])!!}
        </div>
    </div>

    <div class="form-group m-form__group row">

        <div class="col-lg-6">
            <label for="unit_price">{!! trans('main.unit_price') !!}</label>
            {!! Form::text('unit_price',null,['class'=>'form-control ','id'=>'unit_price','placeholder'=>trans('main.unit_price')])!!}
        </div>


        <div class="col-lg-6">
            <label for="sale_price">{!! trans('main.sale_price') !!}</label>
            {!! Form::text('sale_price',null,['class'=>'form-control ','id'=>'sale_price','placeholder'=>trans('main.sale_price')])!!}
        </div>


        <div class="col-lg-6">
            <label for="purchase_price">{!! trans('main.purchase_price') !!}</label>
            {!! Form::text('purchase_price',null,['class'=>'form-control ','id'=>'purchase_price','placeholder'=>trans('main.purchase_price')])!!}
        </div>

    </div>

    <div class="form-group m-form__group row">
    @foreach(App\Models\Variation::orderBy('sort','ASC')->get() as $variation)
        @php
        $itemVariation = $resource->item_variations()->where('variation_id',$variation->id)->first();
        $labelName = 'label_'.App()->getLocale();
        $labelValue = 'value_'.App()->getLocale();
        @endphp
        @if($variation->type == 'textarea')
            <div class="{{$variation->cols}}">
                <label for="{{$variation->name.'_'.$variation->id}}">{!! $variation->$labelName !!}</label>
                <textarea  name="variations[{{$variation->id}}]" {{$variation->options}}>{{ !empty($itemVariation) ? $itemVariation->$labelValue : $variation->$labelValue}}</textarea>
            </div>
        @elseif($variation->type == 'checkbox' || $variation->type == 'radio')
            <div class="{{$variation->cols}}">
                <label for="{{$variation->name.'_'.$variation->id}}">{!! $variation->$labelName !!}</label>

                <input type="{{$variation->type}}" name="variations[{{$variation->id}}]" {!!$variation->options!!}  id="{{$variation->name.'_'.$variation->id}}"
                {{ (!empty($itemVariation) && $itemVariation->$labelValue == $variation->$labelValue ) ? "checked" : ""}}
                value="{{$variation->$labelValue}}">

            </div>
        @else
            <div class="{{$variation->cols}}">
                <label for="{{$variation->name.'_'.$variation->id}}">{!! $variation->$labelName !!}</label>
                <input type="{{$variation->type}}" name="variations[{{$variation->id}}]" {!!$variation->options!!}  id="{{$variation->name.'_'.$variation->id}}" value="{{ !empty($itemVariation) ? $itemVariation->$labelValue : $variation->$labelValue }}">
            </div>

        @endif
    @endforeach
    </div>

    <div class="col-lg-12">
        <label for="name">{!! trans('main.taxes') !!}</label>
        {!! Form::select('item_taxes[]',itemtaxes(),$resource->taxes(),['class'=>'form-control
        m-input select2','multiple','id'=>'taxes'])!!}
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

            })
            ->get()->pluck('name','id'),$resource->responsables(),['class'=>'form-control
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
