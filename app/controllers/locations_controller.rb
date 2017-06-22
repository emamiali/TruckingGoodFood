class LocationsController < ApplicationController

  def index
    @truck = Truck.find_by_id(params[:truck_id])
    @locations = @truck.locations
  end

  def new
    @truck = Truck.find_by_id(params[:truck_id])
    @location = @truck.locations.new
  end

def method
  #code
end

  def create
    @truck = Truck.find_by_id(params[:truck_id])
    @location = @truck.locations.create(location_params)
    if current_user == nil
      explode
      flash[:error] = @location.errors.full_messages.join(", ")
      redirect_to new_user_session_path
      return
    else @location.user_id = current_user.id
    end
    if @location.save
      flash[:notice] = "Successfully Added a new location"
      redirect_to truck_locations_path(@truck.id)
    else
      flash[:error] = @location.errors.full_messages.join(", ")
      redirect_to new_truck_location_path
    end
  end

  def show
    @truck = Truck.find_by_id(params[:truck_id])
    @locations = @truck.locations.find_by_id(params[:id])
  end

  def edit
    @truck = Truck.find_by_id(params[:truck_id])
    @location = @truck.locations.find_by_id(params[:id])
  end

  def update
    @truck = Truck.find_by_id(params[:truck_id])
    if @locations = @truck.locations.update(location_params)
      flash[:notice] = "Successfully updated location"
      redirect_to truck_location_path
    else
      flash[:error] = @location.errors.full_messages.join(", ")
      redirect_to edit_truck_location_path
    end
  end

  def destroy
    @truck = Truck.find_by_id(params[:truck_id])
    @location = @truck.locations.destroy
    flash[:notice] = "Successfully
    Deleted Location"
    redirect_to truck_path(params[:truck_id])
  end

  private

  def location_params
    params.require(:location).permit(:address, :hours)
  end

end
