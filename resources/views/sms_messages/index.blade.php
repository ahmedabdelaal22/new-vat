@extends('layouts.app')
@section('title') {{trans('main.'.$basicRoute)}} @endsection
@section('header')@endsection
@section('breadcrumb')
    @php($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute.'.index'),])
    @includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')

    <div class="m-portlet m-portlet--mobile">
        @include("layouts.table_buttons")

        <div class="m-portlet__body ">
            <div id="m_table_1_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                @include($basicRoute.'._filter_inputs')
                <div class="data" id="table-data">
                    @include($basicRoute.'._table')
                </div>
            </div>
        </div>
    </div>

@endsection
@section('scripts')






@endsection

