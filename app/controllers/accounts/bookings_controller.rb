class Accounts::BookingsController < ApplicationController
  skip_after_action :verify_policy_scoped, :only => :index

  def index
    @user = current_user
    @animal = Animal.new
    @bookings = Booking.all
    @past_bookings = @user.bookings.select{ |booking| booking.end_date < Date.today }
    @future_bookings = @user.bookings.select{ |booking| booking.end_date > Date.today }
    @owner_bookings = @bookings.select{ |booking| booking.animal.user == current_user }
    @animals = @user.animals
  end
end
