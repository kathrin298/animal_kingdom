class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @animal = Animal.find(@booking.animal_id)
    @user = User.find(@booking.user_id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def destroy
    if @booking.destroy
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :start_time, :duration, :total_fee, :animal, :user)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end