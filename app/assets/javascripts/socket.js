//= require websocket_rails/main

var dispatcher = new WebSocketRails('localhost:3000/websocket');

dispatcher.on_open = function(data) {
    console.log('Connection has been established: ' + data);
    // You can trigger new server events inside this callback if you wish.
};

var message = "bob";

dispatcher.trigger('new_user', message);

// subscribe to the channel
var channel = dispatcher.subscribe('truck_channel');

// bind to a channel event
channel.bind('truck_event', function(data) {
    console.log('truck_channel event received: ' + JSON.stringify(data));
});