class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    #make a new user and pass to the form
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private #making the params private

  def user_params
    params.require(:user).permit(:business_name, :email, :password)
  end

end #end of class
# TODO: remove this comment
