@foreach($users as $user)
    <a href="{{route('chats.index',['to_id'=>$user->id])}}" data-route="{{route('chats.show',$user->id)}}" class="startChatWithUser" data-id={{$user->id}}>
        <div class="m-widget3__item">
            <div class="m-widget3__header">
                <div class="m-widget3__user-img">
                    @if(!empty($user->image))
                        <img class="m-widget3__img" src="{{url($user->image)}}" alt="">
                    @endif
                    
                </div>
                <div class="m-widget3__info">
                    <div class="d-flex">
                        <span class="m-badge {{($user->is_online == 1) ? 'm-badge--success':'m-badge--danger'}} online_user_{{$user->id}} chat_users_icon"  style="min-width: 7px;min-height:7px;">
                        </span>
                        <span class="m-widget3__username">
                           <div>{{$user->name}}</div>
                            <div>{{$user->email}}</div>
                        </span>
                    </div>                
                </div>
            </div>
        </div>
    </a>
@endforeach