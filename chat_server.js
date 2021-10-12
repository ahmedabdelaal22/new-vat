var mysql = require('mysql')
// Let’s make node/socketio listen on port 3000
var io = require('socket.io').listen(3000)
// Define our db creds
var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password:'as-123456',
    database: 'crm'

})

// Log any errors connected to the db
db.connect(function(err){
    if (err) console.log(err)
})

// Define/initialize our global vars
var notes = []
var isInitNotes = false
var socketCount = 0
var loginUsers = []

io.sockets.on('connection', function(socket){

    // console.log(socket.get(client_id));
    // Socket has connected, increase socket count
    socketCount++
    // Let all sockets know how many are connected
    io.sockets.emit('users connected', socketCount)

    socket.on('disconnect', function() {
        // console.log('welcome new user ');
        // Decrease the socket count on a disconnect, emit
        socketCount--
        io.sockets.emit('users connected', socketCount)
    });



    socket.on('sendMessage', function(data){
        // console.log('new note event ');
        // console.log(data);
        // New note added, push to all sockets and insert into db
        // notes.push(data)
        io.sockets.emit('new Message', data)
        // Use node's db injection format to filter incoming data
        db.query('INSERT INTO chat_channel_messages (from_id , to_id , message,seen) VALUES ('+data.from_id+','+data.to_id+',"'+data.message+'",0)')
    })

    socket.on('loginUserId',function(data){
        
        if (loginUsers.includes(data.user_id) !== true ) {

            loginUsers.push(data.user_id);

        }

        db.query('UPDATE users set is_online = 1 where id ='+data.user_id);

        socket.emit('loginUserId',loginUsers);

    });

    // empty login users array to clear cached ids 
    loginUsers = [];

    function emitGetLoginUserEvent() {
        
        socket.emit('get_login_user_id');

        db.query('UPDATE users set is_online = 0 ');

    }

    // emit event every number of minutes to get login users ids 
    setInterval(emitGetLoginUserEvent, 3000); //time is in ms
    
})
