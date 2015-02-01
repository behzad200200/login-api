class ContractorsController < ApplicationController
  def create
    contractor = Contractor.new(contractor_params)
    respond_to do |format|
      if contractor.save
        format.json{ render json: contractor}
      else
        format.json {render json: contractor.errors, status: :unprocessable_entity}
      end
    end
  end

  def contractor_params
    params.require(:contractor).permit()
  end
end
