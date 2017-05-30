class User < ApplicationRecord
  has_secure_password
  has_many :trucks
  has_many :menus, through: :trucks

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

end
