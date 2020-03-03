class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render 'new'
    end
  end

  private

  def animal_params # I think user needs to be delete here, I'll do it on the next branch
    params.require(:animal).permit(:name, :category, :species, :hourly_rate, :gender, :user, :place_of_origin, :description, :age, photos: [])
  end

end
