<script type="text/javascript">
$(document).ready(function(){

    $('.chat_btn').on('click', function() {
        $('.chat_container').toggleClass('open_chat');
    });
    $(document).on('click', '.close_user_chat', function() {
        $(this).closest('.chat_single_user_block').remove();
        // console.log("close"); 
    });
    scrollToTheEndofChatBox();
    // Connect to our node/websockets server
    var socket = io.connect('http://localhost:3000');
 
    socket.on('new Message', function(data){
        // console.log('dddddd');
        const audio = new Audio("./dashboard/message_tone.mp3");
        
        audio.play();

        $('#messageInput_'+data.from_id).val('');
        
        $('#messageInput_'+data.to_id).val('');
        
        var messageFromHtml = '<div class="m-messenger__wrapper">'
                        +'<div class="m-messenger__message m-messenger__message--in">'
                            +'<div class="m-messenger__message-pic">'
                            +'</div>'
                            +'<div class="m-messenger__message-body">'
                                +'<div class="m-messenger__message-arrow"></div>'
                                +'<div class="m-messenger__message-content">'
                                    +'<div class="m-messenger__message-text">'
                                        + data.message
                                    +'</div>'
                                +'</div>'
                            +'</div>'
                        +'</div>'
                    +'</div>';

        var messageToHtml = '<div class="m-messenger__wrapper">'
                                +'<div class="m-messenger__message m-messenger__message--out">'
                                    +'<div class="m-messenger__message-body">'
                                        +'<div class="m-messenger__message-arrow"></div>'
                                            +'<div class="m-messenger__message-content">'
                                                +'<div class="m-messenger__message-text">'
                                                + data.message
                                                +'</div>'
                                            +'</div>'
                                        +'</div>'
                                    +'</div>'
                                +'</div>';

            if ($('#messageInput_'+data.to_id).attr('data-from_id') !== data.from_id) {
                messageHtml = messageFromHtml;
                
            }else{
                messageHtml = messageToHtml;
                
            }

            $('#messagesSection_'+data.from_id).append(messageHtml);
            $('#messagesSection_'+data.to_id).append(messageHtml);

        scrollToTheEndofChatBox();
        
    })
    
    // New socket connected, display new count on page

    socket.on('users connected', function(data){
        $('#usersConnected').html('Users connected: ' + data)
    });

    socket.on('get_login_user_id', function(data){
        @if(Auth()->check())
            socket.emit('loginUserId', {user_id : "{!! Auth()->user()->id !!}"})
        @endif
    });

    socket.on('loginUserId',function(data){
        
        $('.m-badge--success').each(function(i){
            // console.log('a');
            $(this).removeClass('m-badge--success');
            $(this).addClass('m-badge--danger');
        });

        $.each(data,function(index,user_id){

            $('.online_user_'+user_id).each(function(i){
                // console.log('a');
                $(this).removeClass('m-badge--danger');
                $(this).addClass('m-badge--success');
            });

        });


    });

    $(document).on('keypress','#messageInput',function(e){
        var key = e.which;
        if(key == 13)  // the enter key code
        {
           sendMessage($(this).attr('data-to_id')); 
        }
    });


    $(document).on('click','#sendMessage',function(e){

        e.preventDefault();
        sendMessage($(this).attr('data-to_id'));
        
    });


    function sendMessage(userId){
        // console.log(userId);
        var inputObject = $('#messageInput_'+userId),
            message = inputObject.val(),
            from_id = inputObject.attr('data-from_id'),
            to_id = inputObject.attr('data-to_id');
            // console.log(inputObject.val());
        	socket.emit('sendMessage', {from_id : from_id , to_id : to_id ,message: message})

    }
});

$(document).on('click','.startChatWithUser',function(e){
    e.preventDefault();
    var route = $(this).attr('data-route'); 
    var userId = $(this).attr('data-id');
    startChatWithUser(route,userId);
});

$(document).on('keyup','.getChatBoxUsers',function(e){

    e.preventDefault();
    // $('#load').addClass('show');
    var route = "{{route('chats.get_users_box')}}";

    $.ajax({
        url: "{{route('chats.get_users_box')}}",
        data:{
            'users_search':$(this).val()
        },
    }).done(function (data) {
        $('#chatBoxUsers').html(data);
        // $('#load').removeClass("show");
    }).fail(function () {
        alert('an error in loading .');
    });
});

function startChatWithUser(route,userId){
    
    // $('#load').addClass('show');

    $.ajax({
        url: route
    }).done(function (data) {
        if (document.getElementById('userChatBox_'+userId) == null) {
            $('#chatBoxData').append(data);
            scrollToTheEndofChatBox();
            // $('#load').removeClass("show");
            $('.chat_single_user_block').show();
        }
       
    }).fail(function () {
        alert('an error in loading .');
    });
}

function scrollToTheEndofChatBox(){

    if($('#messagesSection').length <= 0){
        return false;
    }

    // var toScroll = 0;

    // var divWindow = $('#messagesSection').offset().top;

    // var clickedLink = 0;
    
    // $('.m-messenger__wrapper').each(function(index){
    //     clickedLink = parseFloat(clickedLink) + parseFloat($(this).outerHeight()); 
    // });
    
    // toScroll += clickedLink - divWindow; 
    
    // $('#messagesSection').animate({ scrollTop: toScroll }, 900);
}

</script>