class ClaimsController < ApplicationController
  before_action :set_claim, only: %i[ show edit update destroy ]

  # GET /claims or /claims.json
  def index
    @claims = Claim.all
  end

  # GET /claims/1 or /claims/1.json
  def show
  end

  # GET /claims/new
  def new
    @claim = Claim.new
  end

  # GET /claims/1/edit
  def edit
  end

  # POST /claims or /claims.json
  def create
    @claim = Claim.new(claim_params)

    respond_to do |format|
      if @claim.save
        format.html { redirect_to @claim, notice: "Claim was successfully created." }
        format.json { render :show, status: :created, location: @claim }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claims/1 or /claims/1.json
  def update
    respond_to do |format|
      if @claim.update(claim_params)
        format.html { redirect_to @claim, notice: "Claim was successfully updated." }
        format.json { render :show, status: :ok, location: @claim }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claims/1 or /claims/1.json
  def destroy
    @claim.destroy
    respond_to do |format|
      format.html { redirect_to claims_url, notice: "Claim was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def claim_type
    @claim_types = ClaimType.all
  end

  def new_claim_type
    @claim_type = ClaimType.new
  end

  def create_claim_type
    @claim_type = ClaimType.new(claim_type_params)
    if @claim_type.save 
      redirect_to ct_claims_path
    else
      render 'new_claim_type'
    end
  end

  def edit_claim_type
    @claim_type = ClaimType.find(params[:id])
  end

  def update_claim_type
    @claim_type = ClaimType.find(params[:id])
    @claim_type.update(claim_type_params)
    respond_to do |format|
      if @claim_type.update(claim_type_params)
        format.html { redirect_to ct_claims_path, notice: "Claim Type was successfully updated." }
        format.json { render :claim_type, status: :ok, location: @claim_type }
      else
        redirect_to editct_claim_path
      end
    end
  end

  def delete_claim_type
    @claim_type = ClaimType.find(params[:id])
    @claim_type.destroy
    respond_to do |format|
      format.html { redirect_to ct_claims_path, notice: "Deleted" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim
      @claim = Claim.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def claim_params
      params.require(:claim).permit(:claim_name, :amount, :claim_date, :claim_type_id)
    end

    def claim_type_params
      params.require(:claim_type).permit(:name, :id)
    end
end
