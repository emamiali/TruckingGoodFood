class LocationsController < ApplicationController

  def index
    @truck = Truck.find_by_id(params[:truck_id])
    explode 
  end

end
