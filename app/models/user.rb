class User < ApplicationRecord
  validates :business_name, :permit_id, :password, :password_confirmation, presence: true
  validates :permit_id, :email, uniqueness: true
  validates :password, confirmation: true

  has_secure_password
  has_many :trucks
  has_many :menus, through: :trucks
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

end
