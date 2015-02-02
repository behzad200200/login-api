class ContractorsController < ApplicationController
  def create
    contractor = Contractor.new(contractor_params)
    binding.pry
    begin
      if contractor.save
        user = contractor.build_user(user_params)
        
        if user.save
          @client_id = SecureRandom.urlsafe_base64(nil, false)
          @token = SecureRandom.urlsafe_base64(nil, false)
          user.tokens[@client_id] = {
              token: BCrypt::Password.create(@token),
              expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i
          }
          user.save!
          update_auth_header
        end
        render json: {
            status: 'success',
            data: @resource.as_json
        }
      else
        clean_up_passwords @resource
        render json: {
            status: 'error',
            data: @resource,
            errors: @resource.errors.to_hash.merge(full_messages: @resource.errors.full_messages)
        }, status: 403
      end
    rescue ActiveRecord::RecordNotUnique
      clean_up_passwords @resource
      render json: {
          status: 'error',
          data: @resource,
          errors: ["An account already exists for #{@resource.email}"]
      }, status: 403
    end
  else
    format.json {render json: contractor.errors, status: :unprocessable_entity}
  end

  def contractor_params
    params.require(:contractor).permit(:first_name, :last_name, :mobile_phone, :street, :suburb, :state, user_attributes: [:email, :password, :password_confirmation])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
