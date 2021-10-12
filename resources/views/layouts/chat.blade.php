    <div class="chat-general-div">

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
        <div>
            <div class="m-portlet m-portlet--mobile">
                <div class="chat_user_block" id="chatBoxData">
                    
                </div>
            </div>


            
        </div>
        <div class="chat_users">
            <div class="chat_btn">
                <i class="fa fa-comments"></i>
            </div>  
            <div class="m-portlet m-portlet--mobile chat_container">
              <div class="input-group search_chat">
                        <input type="text" name="users_search" class="form-control getChatBoxUsers" id="m_clipboard_1" placeholder="Search">
                        <div class="input-group-append">
                            <span href="#" class="btn btn-secondary text-center " data-clipboard="true" data-clipboard-target="#m_clipboard_1">
                                <i class="la la-search"></i>
                            </span>
                        </div>
                    </div>
                <div class="m-portlet__body chat_users_scroll">
                    <div class="clearfix"></div>
                    <div class="m-widget3" id="chatBoxUsers">
                        <!-- <span style='font-size:100px;'>&#128565;</span> -->

                        @include('chats.chat_box_users',['users'=>App\Models\User::where('id','!=',Auth()->user()->id)->orderBy('is_online','DESC')->get()])
                    </div>

                </div>
            </div>
        </div>
        
    </div>