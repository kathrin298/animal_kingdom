class ReviewsController < ApplicationController
    before_action :set_booking, only: [:new, :create]
    skip_after_action :verify_authorized, :only => :create


  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = @booking.user
    if @review.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:rating, :title, :content)
  end
end
