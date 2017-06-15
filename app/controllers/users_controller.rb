class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
    @trucks = @user.trucks
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Successfully updated profile!!"
      redirect_to user_path(params[:id])
    else
      flash[:error] = @user.errors.full_message.join(", ")
      redirect_to edit_users_path
      #check this redirect_to
    end
  end

  private #making the params private

  def user_params
    params.require(:user).permit(:business_name, :email, :password, :logo, :permit_id, :avatar)
  end

end #end of class
# TODO: remove this comment
