class MessagesController < ApplicationController
  def index
    @booking = Booking.find(params[:booking_id])
    @messages = policy_scope(Message).order(created_at: :asc)
    @message = Message.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.booking = @booking
    authorize @message
    if @message.save
      respond_to do |format|
        format.html { redirect_to booking_messages_path(@message.booking) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'index' }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

