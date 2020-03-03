class AnimalsController < ApplicationController

  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_animal, only: [:show, :edit, :destroy, :update, :delete]

  def index
    # @animals = Animal.all
    @animals = policy_scope(Animal).order(created_at: :desc)
  end

  def show
    authorize @animal
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    authorize @animal
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render 'new'
    end
  end

  def edit
    authorize @animal
  end

  def update
    authorize @animal
    if @animal.update(animal_params)
      redirect_to animal_path(@animal)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @animal
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
