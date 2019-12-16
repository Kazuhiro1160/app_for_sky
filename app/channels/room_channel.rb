class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    comment = Comment.create!(content: data['comment'], user_id: current_user.id, post_id: data['post_id'])
    render_comment = ApplicationController.renderer.render(partial: 'comments/comment', locals: {comment: comment})
    ActionCable.server.broadcast 'room_channel', comment: render_comment, post_id: data['post_id']
  end
end
