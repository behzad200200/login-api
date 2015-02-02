class User < ActiveRecord::Base
  belongs_to :member, polymorphic: true, dependent: :destroy
  devise :database_authenticatable, :recoverable,
         :trackable, :validatable, :registerable,
         :omniauthable

  include DeviseTokenAuth::Concerns::User
  devise_modules.delete(:confirmable) if  devise_modules.include?(:confirmable)
  before_create :skip_confirmation!
end
