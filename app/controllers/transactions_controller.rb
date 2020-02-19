class TransactionsController < ApplicationController
  include BuildParams

  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  # GET /transactions
  # GET /transactions.json
  def index
    @current_merchant = Merchant.find(params[:merchant_id])
    @transactions = @current_merchant.initial_transactions
    render json: @transactions
  end




  def create
    @transaction = make_params(params, @merchant)
    render json: @transaction
  end



  private


    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:uuid, :amount, :status)
    end
end
