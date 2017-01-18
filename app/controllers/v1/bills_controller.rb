module V1
  class BillsController < ApplicationController
    # skip_before_action :authenticate_user_from_token!
    def index
      bills = Bill.all
      render json: bills, each_serializer: BillSerializer
    end

    def show
      bill = Bill.find(params[:id])
      render json: bill, each_serializer: BillSerializer
    end
  end
end
