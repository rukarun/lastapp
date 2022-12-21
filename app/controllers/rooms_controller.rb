class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to rooms_path
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservations = Reservation.new
  end

  private
    def room_params
      params.require(:room).permit(:room_name, :room_introduction, :price, :address, :room_image, :user_id)
    end
end
