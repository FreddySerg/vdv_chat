class MainController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        @messages = Message.get_messages
      end
      format.js do
        new_message = Message.new(:text => params[:text])
        new_message.save
        if new_message.valid?
          @messages = Message.get_messages
        else
          render :nothing => true
        end
      end
    end
  end

  def to_active
    message = Message.find(params[:message_id])
    message.update_attributes(:active => true)
    message.save
    respond_to do |format|
      format.js do
        @messages = Message.get_messages
      end
    end
  end
end