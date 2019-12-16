App.room = App.cable.subscriptions.create( "RoomChannel",  {
    connected: function () {
        console.log('connected')
        // Called when the subscription is ready for use on the server
    },

    disconnected: function () {
        // Called when the subscription has been terminated by the server
    },

    received: function (data) {
        const post_id = $("#comments").data('post_id');
        if(data['post_id'] == post_id){
            $("#comments").append(data['comment'])
        }
        // Called when there's incoming data on the websocket for this channel

    },

    speak: function (comment) {
        return this.perform('speak', {comment: comment, post_id: $("#comments").data('post_id')});
    }
});
document.addEventListener('turbolinks:load', function (){
    input = document.getElementById('comment-content');
    button = document.getElementById('submit');
    button.addEventListener('click', function(){
        content = input.value;
        App.room.speak(content);
        input.value = ''
    });
});


// turbolinks:load
// document.addEventListener('DOMContentLoaded'), function () {
//     const input = document.getElementById('comment-content')
//     const button = document.getElementById('submit')
// }

