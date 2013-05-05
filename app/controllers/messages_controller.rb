class MessagesController < ApplicationController

  skip_authorization_check
  def index
     current_user.unread_messages.update_all({status:MessageStatus::READ})
  end

  def destroy
    if current_user.messages.find(params[:id]).destroy
      render json: {status:'success'}
    else
     render json: {status:'some error'}
    end
  end

  def clear
    current_user.messages.destroy_all
    redirect_to messages_path
  end

end
