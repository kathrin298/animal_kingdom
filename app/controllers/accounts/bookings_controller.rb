class Accounts::BookingsController < ApplicationController
  # before_action :skip_authorization
  # skip_before_action :verify_authorized
  skip_after_action :verify_policy_scoped, :only => :index



  def index
    @user = current_user
    @past_bookings = @user.bookings.select{ |booking| booking.end_date < Date.today }
    @future_bookings = @user.bookings.select{ |booking| booking.end_date > Date.today }
    @owner_bookings = @user.bookings.select{ |booking| booking.animal.user == current_user }
    # skip_authorization
  end
end
