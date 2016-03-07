class ConversationsController < ApplicationController

  before_filter :authenticate_user!

# This is because we don't want the show view inheriting from application.html layout
  layout false

  def create
  	# If a conversation is found, we return it and assign it to the @conversation instance variable.
  	# If no conversation is found between the two users, a new conversation is created.
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    # Render a json with the id of the conversation
    render json: { conversation_id: @conversation.id }
  end

  def show
  	# This id is sent by the javascript code on chat.js
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end
