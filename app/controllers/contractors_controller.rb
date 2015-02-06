class ContractorsController < ApplicationController
  before_filter :set_user, only: [:create, :show]
  def create
    contractor = Contractor.new(contractor_params)
    contractor.user = @user
    if contractor.save
      render json: contractor.contractor_with_association
    else
      render json: {
          status: 'error',
          errors: contractor.errors
      }
    end
  end

  def show
    if @user.member.present? && @user .member.is_a?(Contractor)
      render json: @user.member.json_response
    else
      render json: {}, status: 404
    end
  end

  def new
    render :json => Contractor.new
  end

  def update
    contractor = Contractor.find(params[:id])
    if contractor.update(contractor_params)
      render :json => {notice: 'updated successfully'}
    else
      render :json => {errors: contractor.error}, status: :unprocessable_entity
    end
  end

  private

  def contractor_params
    params.require(:contractor).permit(:first_name,
                                       :last_name,
                                       :mobile_phone,
                                       :street,
                                       :suburb,
                                       :state,
                                       job_roles_attributes: [:id,:title, :start_date, :end_date],
                                       states: [])

  end

  def set_user
    @user = User.find(params[:user_id])
  end
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
