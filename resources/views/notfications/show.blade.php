@extends('layouts.app')
@section('title')@endsection
@section('header')@endsection
@section('breadcrumb')
@php($breadcrumbs=[' إشعارات '=>route('notfications.index'),$resource->title=>route('notfications.show',$resource->id)])
@includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')
<div class="m-portlet m-portlet--mobile">
    <div class="m-portlet__head">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text">
                	{{$resource->title}}
                </h3>
            </div>
        </div>

    </div>
    <div class="m-portlet__body">


		{!! $resource->body !!}
		
		<div class="clearfix"></div>

    </div>
</div>

@endsection
