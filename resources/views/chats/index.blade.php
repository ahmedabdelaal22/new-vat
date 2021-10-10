@extends('layouts.app')
@section('title') {{trans('main.'.$basicRoute)}} @endsection
@section('header')@endsection
@section('breadcrumb')
    @php($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute.'.index'),])
    @includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')

    <div class="row">

        <!-- <div id="load">
            <div class="lds-roller">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div> -->
        <div class="col-md-8" id="chatBoxData">
            
            @include('chats.chat_box')

            
        </div>
        <div class="col-md-4">
            <div class="chat_btn">
                <i class="fa fa-comments"></i>
            </div>
            <div class="m-portlet m-portlet--mobile chat_container">
                
                <div class="m-portlet__body ">
                    <div class="input-group">
                        <input type="text" name="users_search" class="form-control getChatBoxUsers" id="m_clipboard_1" placeholder="...." autocomplete="off">
                        <div class="input-group-append">
                            <span href="#" class="btn btn-secondary text-center " data-clipboard="true" data-clipboard-target="#m_clipboard_1">
                                <i class="la la-search"></i>
                            </span>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <br>
                    <div class="m-widget3" id="chatBoxUsers">
                        <!-- <span style='font-size:100px;'>&#128565;</span> -->

                        @include('chats.chat_box_users',['users'=>App\Models\User::where('id','!=',Auth()->user()->id)->orderBy('is_online','DESC')->get()])
                    </div>

                </div>
            </div>
        </div>
        
    </div>

@endsection


