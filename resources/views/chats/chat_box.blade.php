
<div class="chat_single_user_block" id="userChatBox_{{$toUser->id}}">
    <div class="d-flex align-items-center m-portlet__head user_caht_head">
        @if(isset($toUser) && !empty($toUser))
        <div class="m-widget3">
            <div class="m-widget3__item">
                <div class="m-widget3__header">
                    <div class="m-widget3__user-img">
                        @if(!empty($toUser->image))
                            <img class="m-widget3__img" src="{{url($toUser->image)}}" alt="">
                        @endif
                    </div>
                    <div class="m-widget3__info">
                        <span class="m-badge {{($toUser->is_online == 1) ? 'm-badge--success':'m-badge--danger'}} online_user_{{$toUser->id}} chat_users_icon"  style="min-width: 7px;min-height:7px;">
                        </span>
                        <span class="m-widget3__username">
                            {{$toUser->name}}
                        </span>
                    </div>
                </div>
            </div>
        </div>
        @endif
        <a href="#" title="" class="close_user_chat">
            <i class="flaticon-circle"></i>
            <!-- <i class="fa fa-angle-down"></i> -->
            <!-- <i class="fa fa-window-close"></i> -->
            <!-- <i class="fa fa-times-circle"></i> -->
        </a>
    </div>
    <div class="m-portlet__body ">
        <div class="m-messenger m-messenger--message-arrow m-messenger--skin-light">
            @if(isset($toUser) && !empty($toUser))
                <div class="m-messenger__messages m-scrollable m-scroller ps--active-y" style="height: 270px; overflow:auto; ;" id="messagesSection_{{$toUser->id}}">
                    @if(isset($resources) && !empty($resources))
                        @foreach($resources as $resource)
                            @if($resource->from_id == Auth()->user()->id)
                                <div class="m-messenger__wrapper">
                                    <div class="m-messenger__message m-messenger__message--out">
                                        <div class="m-messenger__message-body">
                                            <div class="m-messenger__message-arrow"></div>
                                            <div class="m-messenger__message-content">
                                                <div class="m-messenger__message-text">
                                                    {!! $resource->message!!}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @else
                                <div class="m-messenger__wrapper">
                                    <div class="m-messenger__message m-messenger__message--in">
                                        <div class="m-messenger__message-pic">
                                        </div>
                                        <div class="m-messenger__message-body">
                                            <div class="m-messenger__message-arrow"></div>
                                            <div class="m-messenger__message-content">
                                                <div class="m-messenger__message-text">
                                                    {!! $resource->message !!}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endif
                        @endforeach
                    @endif
                </div>
                <div class="m-messenger__seperator"></div>
                <div class="m-messenger__form">
                    <div class="m-messenger__form-controls">
                        <input type="text" name="" placeholder="{{trans('main.type_here')}}..." class="m-messenger__form-input" id="messageInput_{{$toUser->id}}" data-from_id="{{auth()->user()->id}}" data-to_id="{{$toUser->id}}" data-user_id ="{{auth()->user()->id}}" autocomplete="off">
                    </div>
                    <div class="m-messenger__form-tools">
                        <button class="m-messenger__form-attachment btn-primary" id="sendMessage" data-to_id="{{$toUser->id}}">
                            <!-- <i class="fa fa-comment"></i> -->
                            <span>{{trans('main.send')}}</span>
                        </button>
                    </div>
                </div>
            @endif
        </div>
    </div>
</div>