class ApplicationController < ActionController::Base
  #before_filter :check
  include DeviseTokenAuth::Concerns::SetUserByToken
  def check
    binding.pry
    ss = 'sdf'
  end

end
