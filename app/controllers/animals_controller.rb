class AnimalsController < ApplicationController
  before_action :find_animal, only: [:show, :edit, :destroy]

  def index
    @animals = Animal.all
  end

  def show; end

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

  def edit; end

  def update
    if @animal.update(animal_params)
      redirect_to animal_path(@animal)
    else
      render 'edit'
    end
  end

  def destroy
    @animal.destroy
    redirect_to animals_path
  end

  private

  def find_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params # I think user needs to be delete here, I'll do it on the next branch
    params.require(:animal).permit(:name, :category, :species, :hourly_rate, :gender, :user, :place_of_origin, :description, :age, photos: [])
  end

end
