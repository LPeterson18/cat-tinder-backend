class CatsController < ApplicationController
  def index
    cats = Cat.all
    render json: cats
  end

  def create
    cat = Cat.create(cat_params)
    render json: cat.valid? ? cat : cat.errors, status: 422
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :age, :enjoys, :profile_pic)
  end
end
