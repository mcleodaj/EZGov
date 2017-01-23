class BillsController < ApplicationController
  before_action :set_bill, only: [:show]

  def index
    @bills = Bill.all
  end

  def show
    bill_path(@bill)
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end
end
