class ContractorsController < ApplicationController
  def create
    contractor = Contractor.new(contractor_params)
    if contractor.save
    else
      format.json {render json: contractor.errors, status: :unprocessable_entity}
    end
  end

  private

  def contractor_params
    params.require(:contractor).permit(:first_name, :last_name, :mobile_phone, :street, :suburb, :state, user_attributes: [:email, :password, :password_confirmation])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
