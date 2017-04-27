class MenusController < ApplicationController

    def index
      @menus = Menu.all
    end

    def new
      @menu = Menu.new
    end

    def create
      @menu = Menu.create(menu_params)
      redirect_to menus_path
    end

    def show
      @menu = Menu.find_by_id(params[:id])
    end

    def create
      Menu.create(menu_params)
      redirect_to menus_path
    end

    def edit
      @menu = Menu.find_by_id(params[:id])
    end

    def update
    @menu = Menu.find(params[:id])
      if @menu.update(menus_params)
        flash[:notice] = "Successfully updated menu."
        redirect_to menus_path
      else
        flash[:error] = @menu.errors.full_messages.join(", ")
        redirect_to edit_menus_path
      end
    end

    def destroy
      @menu = Menu.find(params[:id])
      @menu.destroy
      flash[:notice] = "Successfully deleted recipe."
      redirect_to menus_path
  end

    private

    def menu_params
      params.require(:menu).permit(:food, :description, :price, :is_special)
    end
  end
