@extends('layouts.app')
@section('title') {{trans('main.'.$basicRoute)}} @endsection
@section('header')@endsection
@section('breadcrumb')
    @php($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute),])
    @includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')

    <div class="m-portlet m-portlet--mobile">

        <div class="m-portlet__body ">
            <div id="m_table_1_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
  
                <div class="data" id="table-data">
                    @include($basicViewFolder.'._table')
                </div>
            </div>
        </div>
    </div>

@endsection
@section('scripts')
@endsection

