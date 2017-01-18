module V1
  class UsersController < ApplicationController
    # skip_before_action :authenticate_user_from_token!
    def index
      users = User.all
      render json: users, each_serializer: UserSerializer
    end

    def show
      user = User.find(params[:id])
      render json: user, each_serializer: UserSerializer
    end
  end
end
