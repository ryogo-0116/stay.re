# app/controllers/reservations_controller.rb
class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(room_id: @room.id)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:reservation][:room_id])

    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservations_path
    else
      render :new
    end
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    @total_price = @reservation.total_price
    render :confirm
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in_date, :check_out_date, :num_of_guests, :room_id)
  end
end







