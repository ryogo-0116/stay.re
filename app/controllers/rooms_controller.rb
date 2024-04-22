class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :destroy]

  def index
    @rooms = current_user.rooms
  end

  def show
    @room = Room.find(params[:id])
    session[:selected_room_id] = @room.id
    @reservation = Reservation.new(room_id: @room.id)
  end
  
  
  
  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(rooms_params)
    if @room.save
      redirect_to @room , notice: '宿泊視閲の登録に成功しました'
    else
      render :new
    end
  end


  def destroy
    set_room
    if @room.destroy
      redirect_to rooms_path, notice: '宿泊施設を削除しました'
    else
      redirect_to rooms_path, alert: '宿泊施設の削除に失敗しました'
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:name, :description, :price, :address, :image)
  end
end
