class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:create, :index, :update, :show]
  # GET /merchants
  # GET /merchants.json
  def index
    @merchants = Merchant.all
    render json: MerchantRepresenter.new(@merchants)
  end

  # GET /merchants/1
  # GET /merchants/1.json
  def show
    render json: MerchantShowRepresenter.new(@merchant)
  end

  # GET /merchants/new
  def new
    @merchant = Merchant.new

  end

  # GET /merchants/1/edit
  def edit
  end

  # POST /merchants
  # POST /merchants.json
  def create
    @merchants = Merchant.export(params)
    render json: MerchantRepresenter.new(@merchants)
  end

  # PATCH/PUT /merchants/1
  # PATCH/PUT /merchants/1.json
  def update
      if @merchant.renew_token
        render json: MerchantShowRepresenter.new(@merchant), status: :ok
      else
        render json: @merchant.errors, status: :unprocessable_entity
      end
  end

  # DELETE /merchants/1
  # DELETE /merchants/1.json
  def destroy
    @merchant.destroy
    render json: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def merchant_params
      params.require(:merchant).permit(:name, :description, :email, :status, :total_transaction_sum)
    end
end
