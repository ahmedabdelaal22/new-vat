@extends('layouts.app')
@section('title') تعديل بيانات {!!$resource->title!!}@endsection
@section('header')@endsection
@section('breadcrumb')
@php($breadcrumbs=[' إشعارات '=>route('notfications.index'),'تعديل'=>route('notfications.edit',$resource->id)])
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
                                تعديل {!! $resource->title!!}
                            </h3>
                        </div>
                    </div>
                </div>

                <!--begin::Form-->

                {!! Form::model($resource,['method'=>'put','route'=>['notfications.update',$resource->id],'files'=>'true','class'=>'m-form m-form--fit
                m-form--label-align-right'])!!}
                @include('notfications._form')

                <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions">
                        <button type="submit" class="btn btn-primary">حفظ</button>
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
