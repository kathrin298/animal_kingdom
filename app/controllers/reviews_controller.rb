class ReviewsController < ApplicationController

    before_action :set_booking, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    if @review.save
      # TODO: Change to booking
      # redirect_to root_path
      redirect_to booking_path(@booking.id)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:rating)
  end

  end
