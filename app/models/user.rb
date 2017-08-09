class User < ApplicationRecord
  validates :business_name, :permit_id, presence: true
  validates :password, :password_confirmation, presence: true, :on => :create
  validates :permit_id, :email, uniqueness: true
  validates :password, confirmation: true

  has_secure_password
  has_many :trucks
  has_many :menus, through: :trucks
  has_many :locations, through: :trucks


  has_attached_file :avatar,
                    styles: { :large => "600x400>",
                              :medium => "300x200>",
                              :small => "100x75>",
                              :thumb => "60x42>" },
                    :default_url => "/assets/avatar.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

end
