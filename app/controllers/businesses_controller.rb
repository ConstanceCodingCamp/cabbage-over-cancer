class BusinessesController < ApplicationController
  before_action :set_business, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /businesses or /businesses.json
  def index
    @businesses = Business.all
  end

  # GET /businesses/1 or /businesses/1.json
  def show
  end

  # GET /businesses/new
  def new
    # @business = Business.new
    @business = current_user.businesses.build
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses or /businesses.json
  def create
    # @business = Business.new(business_params)
    @business = current_user.businesses.build(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: "new entry saved" }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1 or /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: "update successful" }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1 or /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: "record deleted" }
      format.json { head :no_content }
    end
  end

# to route to assign current user to active user
  
  def correct_user
    @business = current_user.businesses.find_by(id: params[:id])
    redirect_to businesses_path, notice: "Not an authorized action." if @business.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.require(:business).permit(:business_name, :website, :social_media, :email, :user_id)
    end
end
