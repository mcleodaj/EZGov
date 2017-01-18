module V1
  class StatesController < ApplicationController
    # skip_before_action :authenticate_user_from_token!
    def index
      states = State.all
      render json: states, each_serializer: StateSerializer
    end

    def show
      state = State.find(params[:id])
      render json: state, each_serializer: StateSerializer
    end
  end
end
