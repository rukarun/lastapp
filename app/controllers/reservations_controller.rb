class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to reservations_path notice:"予約が完了しました"
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :room_id)
    end 
end
