module V1
  class PeopleController < ApplicationController
    # skip_before_action :authenticate_user_from_token!
    def index
      people = Person.all
      render json: people, each_serializer: PersonSerializer
    end

    def show
      person = Person.find(params[:id])
      render json: person, each_serializer: PersonSerializer
    end
  end
end
