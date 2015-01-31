class ApplicationController < ActionController::Base
 
 
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   before_filter :check_status

 
  

  	
 
    def  check_status
     s= 'sdfdsfsdf'
    end
  
  protected
   def json_request?
     request.format.json?
   end

end
