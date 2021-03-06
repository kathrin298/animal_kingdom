class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def show
    @animal = Animal.find(@booking.animal_id)
    @user = User.find(@booking.user_id)
    @review = Review.new
  end

  def new
    @booking = Booking.new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    @booking.user = current_user
    @start_date = Date.parse(params[:booking][:start_date])
    @end_date = Date.parse(params[:booking][:end_date])
    @duration = (@end_date - @start_date).to_i
    @booking.total_fee = (@animal.daily_rate * @duration).round(2)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    @animal = @booking.animal
  end

  def update
    @start_date = Date.parse(params[:booking][:start_date])
    @end_date = Date.parse(params[:booking][:end_date])
    @duration = (@end_date - @start_date).to_i
    @booking.total_fee = @booking.animal.daily_rate * @duration
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render 'edit'
    end
  end

  def destroy
    if @booking.end_date > Date.today && @booking.destroy
      redirect_to dashboard_path
    else
      render 'bookings/index'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_fee, :animal, :user)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
