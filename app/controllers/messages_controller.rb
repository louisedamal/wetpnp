class MessagesController < ApplicationController
  def index
    @booking = Booking.find(params[:booking_id])
    @messages = policy_scope(Message).order(created_at: :asc)
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @message = Message.new
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.booking = Booking.find(params[:booking_id])
    authorize @message
    if @message.save
      redirect_to booking_messages_path(@message.booking)
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

