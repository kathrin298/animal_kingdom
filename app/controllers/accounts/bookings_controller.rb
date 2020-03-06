class Accounts::BookingsController < ApplicationController
  skip_after_action :verify_policy_scoped, :only => :index

  def index
    @user = current_user
    @animal = Animal.new
    @past_bookings = @user.bookings.select{ |booking| booking.end_date < Date.today }
    @future_bookings = @user.bookings.select{ |booking| booking.end_date > Date.today }
    @owner_bookings = @animal.bookings.select{ |booking| booking.user == current_user }
    @animals = @user.animals
  end
end
