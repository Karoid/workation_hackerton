class HomeController < ApplicationController
  def index
    @spots = Spot.all
    @spots = @spots.where(category_id: params[:category_id]) if params[:category_id]
  end

  def show
    @spot = Spot.find(params[:id])
  end
end
