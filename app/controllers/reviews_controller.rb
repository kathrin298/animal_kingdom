class ReviewsController < ApplicationController

  #   before_action :set_booking, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      # TODO: Change to booking
      redirect_to root_path
      # redirect_to animal_path(@animal.id)
    else
      render :new
    end
  end

  private

  # def set_booking
  #   @booking = Booking.find(params[:booking_id])
  # end

  def review_params
    params.require(:review).permit(:rating)
  end

  end
