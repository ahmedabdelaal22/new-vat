@extends('layouts.app')
@section('title') {!! trans('main.role_permissions')!!} @endsection
@section('header')@endsection
@section('breadcrumb')
    @php($breadcrumbs=[ trans('main.role_permissions') =>route('role_permissions.index'),])
    @includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')

    <div class="m-portlet m-portlet--mobile">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <h3 class="m-portlet__head-text">
                        {!! trans('main.role_permissions')!!}
                    </h3>
                </div>
            </div>

        </div>
        <div class="m-portlet__body" id="table-data">
            @include('role_permissions._table')
        </div>
    </div>

@endsection
