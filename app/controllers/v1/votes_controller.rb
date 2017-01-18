module V1
  class VotesController < ApplicationController
    # skip_before_action :authenticate_user_from_token!
    def index
      votes = Vote.all
      render json: votes, each_serializer: VoteSerializer
    end

    def show
      vote = Vote.find(params[:id])
      render json: vote, each_serializer: VoteSerializer
    end
  end
end
