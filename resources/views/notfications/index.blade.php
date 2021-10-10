@extends('layouts.app')
@section('title') {{trans('main.'.$basicRoute)}} @endsection
@section('header')@endsection
@section('breadcrumb')
@php($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute.'.index'),])
@includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')

 <div class="m-portlet m-portlet--mobile">
    <div class="m-portlet__head">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text">
                   {{trans('main.'.$basicRoute)}}
                </h3>
            </div>
        </div>
        @if(Auth()->user()->is_super_admin || Auth()->user()->can('notfications create'))
        <div class="m-portlet__head-tools">
            <ul class="m-portlet__nav">
                <li class="m-portlet__nav-item">
                    <a href="{!!route($basicRoute.'.create')!!}" class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air">
                        <span>
                            <i class="la la-plus"></i>
                            <span>{{trans('main.add')}}</span>
                        </span>
                    </a>
                </li>
                <li class="m-portlet__nav-item"></li>

            </ul>
        </div>
            @endif

    </div>
    <div class="m-portlet__body ">
        <div id="m_table_1_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">

            <div class="data" id="table-data">
                @include($basicRoute.'._table')
            </div>
        </div>
    </div>
</div>

@endsection
