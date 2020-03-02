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
      redirect_to animal_path
    else
      render 'new'
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :category, :species, :hourly_rate, :gender, :user, :place_of_origin, :description, :age, photos: [])
  end

end
