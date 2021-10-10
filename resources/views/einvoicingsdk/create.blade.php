@extends('layouts.app')
@section('title') {{trans('main.'.$basicRoute)}}@endsection
@section('header')@endsection
@section('breadcrumb')
    @php($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute.'.index'),trans('main.add')=>route($basicRoute.'.create')])
    @includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')

    <!--begin::Portlet-->
    <div class="m-portlet m-portlet--tab">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <span class="m-portlet__head-icon m--hide">
                        <i class="la la-gear"></i>
                    </span>
                    <h3 class="m-portlet__head-text">
                        {{trans('main.add')}}
                    </h3>
                </div>
            </div>
        </div>

        <!--begin::Form-->

        {!! Form::open(['method'=>'post','route'=>$basicRoute.'.store','files'=>'true','class'=>'m-form m-form--fit m-form--label-align-right m-form--group-seperator-dashed'])!!}

        @include($basicViewFolder.'._form')

        <div class="m-portlet__foot m-portlet__foot--fit">
            <div class="m-form__actions m-form__actions--solid">
                <button type="submit" class="btn btn-primary">{{trans('main.save')}}</button>
            </div>
        </div>

    {!!Form::close()!!}
    <!--end::Form-->
    </div>

@endsection

