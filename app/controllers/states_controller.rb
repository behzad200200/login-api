class StatesController < ApplicationController
  def index
    states = State.all.map do |state|
      state.as_json(only: [:name])
    end
    render :json=> {states: states}
  end
end