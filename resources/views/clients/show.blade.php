@extends('layouts.app')
@section('title') {{trans('main.'.$basicRoute).' '.$resource->name}} @endsection
@section('header')@endsection
@section('breadcrumb')
@php($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute.'.index'),])
@includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')
@section('content')
<div class="m-content">
    <div class="row">
        <div class="col-xl-3 col-lg-4 pr0">
            <div class="m-portlet m-portlet--full-height  ">
                <div class="m-portlet__body client_profile_con">
                    <div class="m-card-profile client_profile">
                        <div class="m-card-profile__title m--hide">
                            {!!$resource->name!!}
                        </div>

                        <div class="m-card-profile__details">
                            <span class="m-card-profile__name">
                                {{$resource->name}}
                            </span>
                            <a href="" class="m-card-profile__email">
                                {{$resource->email}}
                            </a>
                        </div>
                    </div>
                    <ul class="m-nav">
                        <li class="m-nav__separator m-nav__separator--fit"></li>
                        @if(optional($resource->category)->name)
                        <li class="m-nav__item">
                            <a href="" class="m-nav__link">
                                <span class="m-nav__link-title">
                                    <span class="m-nav__link-wrap">
                                        <span class="m-nav__link-text">
                                            {{optional($resource->category)->name}}
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </li>
                        @endif
                        @if(optional($resource->marketing_way)->name)
                        <li class="m-nav__item">
                            <a href="" class="m-nav__link">
                                <span class="m-nav__link-title">
                                    <span class="m-nav__link-wrap">
                                        <i class="fa fa-globe"></i>
                                        <span class="m-nav__link-text">
                                            {{optional($resource->marketing_way)->name}}
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </li>
                        @endif
                        @if($resource->birth_date)
                        <li class="m-nav__item">
                            <a href="" class="m-nav__link">
                                <span class="m-nav__link-title">
                                    <span class="m-nav__link-wrap">
                                        <i class="fa fa-calendar-alt"></i>
                                        <span class="m-nav__link-text">
                                            {{$resource->birth_date}}
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </li>
                        @endif
                        @if($resource->job)
                        <li class="m-nav__item">
                            <a href="" class="m-nav__link">
                                <span class="m-nav__link-title">
                                    <span class="m-nav__link-wrap">
                                        <i class="fa fa-briefcase"></i>
                                        <span class="m-nav__link-text">
                                            {{$resource->job}}
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </li>
                        @endif
                        @if($resource->address)
                        <li class="m-nav__item">
                            <a href="" class="m-nav__link">
                                <span class="m-nav__link-title">
                                    <span class="m-nav__link-wrap">
                                        <i class="fa fa-map-marker-alt"></i>
                                        <span class="m-nav__link-text">
                                            {{$resource->address}}
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </li>
                        @endif
                        @if($resource->referred_by)
                        <li class="m-nav__item">
                            <a href="" class="m-nav__link">
                                <span class="m-nav__link-title">
                                    <span class="m-nav__link-wrap">
                                        <i class="fa fa-user"></i>
                                        <span class="m-nav__link-text">
                                            {{$resource->referred_by}}
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </li>
                        @endif
                        @if($resource->responsables())
                        <li class="m-nav__item">
                            <a href="" class="m-nav__link">
                                <span class="m-nav__link-title">
                                    <span class="m-nav__link-wrap">
                                        <span class="m-nav__link-text">
                                            @foreach($resource->responsables() as $index=>$value )
                                            <span> {{\App\Models\User::find($value)->name}}</span>
                                            @endforeach
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </li>
                        @endif
                        @if($resource->phones)
                        <li class="m-nav__item">
                            <a href="" class="m-nav__link">
                                <span class="m-nav__link-title">
                                    <span class="m-nav__link-wrap">
                                        <i class="fa fa-phone"></i>
                                        <span class="m-nav__link-text">
                                            @foreach($resource->phones as $row)
                                            <span> {{$row->phone}}</span>
                                            @endforeach
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </li>
                        @endif
                        @if($resource->notes)
                        <li class="m-nav__item">
                            <a href="" class="m-nav__link">
                                <span class="m-nav__link-title">
                                    <span class="m-nav__link-wrap">
                                        <span class="m-nav__link-text">
                                            {{$resource->notes}}
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </li>
                        @endif
                    </ul>
                    <div class="m-portlet__body-separator"></div>

                </div>
            </div>
        </div>
        <div class="col-xl-9 col-lg-8">
            <div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-tools">
                        <ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary"
                            role="tablist">
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1"
                                    role="tab">
                                    <i class="flaticon-share m--hide"></i>
                                    {{trans('main.sales_order')}}
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2"
                                    role="tab">
                                    {{trans('main.sales_invoices')}}
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_3"
                                    role="tab">
                                    {{trans('main.leads')}}
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_4"
                                    role="tab">
                                    {{trans('main.collection')}}
                                </a>
                            </li>
                        </ul>
                    </div>

                </div>
                <div class="tab-content">
                    <div class="tab-pane active" id="m_user_profile_tab_1">
                        <!-- <form class="m-form m-form--fit m-form--label-align-right"> -->
                        <div class="m-portlet__body">

                            @include($basicRoute.'.sales_order')
                        </div>
                        <!-- </form> -->
                    </div>
                    <div class="tab-pane " id="m_user_profile_tab_2">
                        <div class="m-portlet__body">
                            <div class="m-form__actions sales_invoices_table">
                                @include($basicRoute.'.sales_invoices')
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="m_user_profile_tab_3">
                        <div class="m-portlet__body">
                            <div class="">
                                @include($basicRoute.'.sales_invoices')

                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="m_user_profile_tab_4">
                        <div class="m-portlet__body">
                            <div class="">
                                @include($basicRoute.'.collection')

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('scripts')@endsection
