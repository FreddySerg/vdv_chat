class MessagesController < ApplicationController
  def destroy
    Message.find(params[:id]).destroy
    respond_to do |format|
      format.js do
        @messages = Message.get_messages
        #FayeChat.message('/vdv_chat', params[:id].to_i, '', "delete")
        Resque.enqueue(SendMessage, '/vdv_chat', params[:id].to_i, '', "delete")
      end
    end
  end
end