class MessagesController < ApplicationController
  def destroy
    Message.find(params[:id]).destroy
    respond_to do |format|
      format.js do
        @messages = Message.get_messages
      end
    end
  end
end