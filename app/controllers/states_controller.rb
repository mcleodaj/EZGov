class StatesController < ApplicationController
  before_action :set_state, only: [:show]

  def index
    @states = State.all
  end

  def show
    state_path(@state)
  end

  private

  def set_state
    @state = State.find(params[:id])
  end
end
