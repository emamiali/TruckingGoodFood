class MenusController < ApplicationController

    def index
      @truck = Truck.find_by_id(params[:truck_id])
      @menus = @truck.menus
    end

    def new
      @truck = Truck.find_by_id(params[:truck_id])
      @menu = @truck.menus.new
    end

    def create
      @truck = Truck.find_by_id(params[:truck_id])
      @menu = @truck.menus.create(menu_params)
      if current_user == nil
        flash[:error] = @menu.errors.full_messages.join(", ")
        redirect_to new_user_session_path
        return
      else @menu.user_id = current_user.id
      end
      if @menu.save
        flash[:notice] = "Successfully Added a new menu"
        redirect_to truck_menus_path(@truck.id)
      else
        flash[:error] = @menu.errors.full_messages.join(", ")
        redirect_to new_truck_menu_path
      end
    end

    def show
      @truck = Truck.find_by_id(params[:truck_id])
      @menu = @truck.menus.find_by_id(params[:id])
    end

    def edit
      @truck = Truck.find_by_id(params[:truck_id])
      @menu = @truck.menus.find_by_id(params[:id])
    end

    def update
      @truck = Truck.find_by_id(params[:truck_id])
      if @menu = @truck.menus.update(menu_params)
        flash[:notice] = "Successfully updated menu"
        redirect_to truck_menu_path
      else
        flash[:error] = @menu.errors.full_messages.join(", ")
        redirect_to edit_truck_menu_path
      end
    end

    def destroy
      @truck = Truck.find_by_id(params[:truck_id])
      @menu = @truck.menus.destroy
      flash[:notice] = "Successfully
      Deleted Menu"
      redirect_to truck_path(params[:truck_id])
    end

    private

    def menu_params
      params.require(:menu).permit(:food, :description, :price, :is_special)
    end
  end
