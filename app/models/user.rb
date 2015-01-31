class User < ActiveRecord::Base
  belongs_to :member, polymorphic: true, dependent: :destroy
  include DeviseTokenAuth::Concerns::User
  before_create :skip_confirmation!
end
