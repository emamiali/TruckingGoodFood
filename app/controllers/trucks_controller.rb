class TrucksController < ApplicationController

  before_action :find_user

  def index
    @trucks = Truck.all
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.create(truck_params)
    if current_user == nil
      flash[:error] = @truck.errors.full_messages.join(", ")
      redirect_to new_user_session_path
      return
    else @truck.user_id = current_user.id
    end
    if @truck.save
      flash[:notice] = "Successfully created truck"
      redirect_to user_path(@truck.user_id)
    else
      flash[:error] = @truck.errors.full_messages.join(", ")
      redirect_to new_truck_path
    end
  end

  def show
    @truck = Truck.find_by_id(params[:id])
  end


  def edit
    @truck = Truck.find_by_id(params[:id])
  end

  def update
    @truck = Truck.find(params[:id])
    if @truck.update(truck_params)
      flash[:notice] = "Successfully updated truck."
      redirect_to user_path(@truck.user_id)
    else
      flash[:error] = @truck.errors.full_messages.join(", ")
      redirect_to edit_trucks_path
    end
  end

  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy
    flash[:notice] = "Successfully deleted truck."
    redirect_to user_path(@truck.user_id)
  end

  private

  def find_user
    @user = User.find_by_id(params[:user_id])
  end

  def truck_params
    params.require(:truck).permit(:truck_name, :phone_number, :address, :is_cash_only, :picture, :info, :long, :lat, :category, :general_hours)
  end
end
