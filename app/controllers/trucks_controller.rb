class TrucksController < ApplicationController

  before_action :find_user

  def index
    @trucks = Truck.all
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = @user.trucks.create(truck_params)
    redirect_to user_truck_path(user_id: @truck.user_id, id: @truck.id)
  end

  def show
    @truck = @user.trucks.find_by_id(params[:id])
  end


  def edit
    @truck = Truck.find_by_id(params[:id])
  end

  def update
  @truck = Truck.find(params[:id])
    if @truck.update(truck_params)
      flash[:notice] = "Successfully updated truck."
      redirect_to trucks_path
    else
      flash[:error] = @truck.errors.full_messages.join(", ")
      redirect_to edit_trucks_path
    end
  end

  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy
    flash[:notice] = "Successfully deleted recipe."
    redirect_to trucks_path
end

  private

  def find_user
    @user = User.find_by_id(params[:user_id])
  end

  def truck_params
    params.require(:truck).permit(:truck_name, :phone_number, :address, :is_cash_only, :picture, :info, :long, :lat, :category, :general_hours)
  end
end
