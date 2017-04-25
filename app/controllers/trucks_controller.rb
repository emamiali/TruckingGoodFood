class TrucksController < ApplicationController

  def index
    @trucks = Truck.all
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.create(truck_params)
    redirect_to trucks_path
  end

  private

  def truck_params
    params.require(:truck).permit(:truck_name, :phone_number, :address, :is_cash_only, :picture, :info, :long, :lat, :category, :general_hoursA)
  end
end
