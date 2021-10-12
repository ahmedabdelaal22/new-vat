@extends('layouts.app')
@section('title') {!! trans('main.add') .' | ' . trans('main.role_permissions')!!}@endsection
@section('header')@endsection
@section('breadcrumb')
@php($breadcrumbs=[trans('main.role_permissions')=>route('role_permissions.index'),trans('main.add')=>route('role_permissions.create')])
@includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')
<div class="m-content">
    <div class="row">
        <div class="col-md-12">
            <!--begin::Portlet-->
            <div class="m-portlet m-portlet--tab">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide">
                                <i class="la la-gear"></i>
                            </span>
                            <h3 class="m-portlet__head-text">
                                {!! trans('main.add') !!}
                            </h3>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                {!! Form::open(['method'=>'post','route'=>'role_permissions.store','files'=>'true','class'=>'m-form m-form--fit
                m-form--label-align-right'])!!}
                @include('role_permissions._form')

                <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions">
                        <button type="submit" class="btn btn-primary"> {!! trans('main.save') !!}</button>
                    </div>
                </div>
                {!!Form::close()!!}
                <!--end::Form-->
            </div>
        </div>
    </div>
</div>
@endsection
@section('scripts')@endsection
