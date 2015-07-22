class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]

  # GET /media
  # GET /media.json
  def index
    @media = Medium.all
  end

  # GET /media/1
  # GET /media/1.json
  def show
  end

  # GET /media/new
  def new
    @medium = Medium.new
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media
  # POST /media.json
  def create
    @medium = Medium.new(medium_params)

    respond_to do |format|
      if @medium.save
        format.html { redirect_to @medium, notice: 'Medium was successfully created.' }
        format.json { render :show, status: :created, location: @medium }
      else
        format.html { render :new }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media/1
  # PATCH/PUT /media/1.json
  def update
    respond_to do |format|
      if @medium.update(medium_params)
        format.html { redirect_to @medium, notice: 'Medium was successfully updated.' }
        format.json { render :show, status: :ok, location: @medium }
      else
        format.html { render :edit }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium.destroy
    respond_to do |format|
      format.html { redirect_to media_url, notice: 'Medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      @medium = Medium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medium_params
      params.require(:medium).permit(:mediaPath, :mediaComment, :date)
    end
    
 swagger_controller :media, "Medium Management"

  swagger_api :index do
    summary "Fetches all Medium items"
    notes "This lists all the active Media"
    param :query, :page, :integer, :optional, "Page number"
    param :path, :nested_id, :integer, :optional, "Medium Id"   
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
    response :requested_range_not_satisfiable
  end

  swagger_api :show do
    summary "Fetches a single Medium item"
    param :path, :id, :integer, :optional, "Medium Id"
    response :ok, "Success", :Medium
    response :unauthorized
    response :not_acceptable
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new Medium"
    param :string, :mediaPath, :string, :required, "mediaPath"
    param :string, :mediaComment, :string, :required, "mediaComment" 
    param :string, :date, :dateTime, :required, "date"    
    response :unauthorized
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing Medium"
   param :string, :mediaPath, :string, :required, "mediaPath"
    param :string, :mediaComment, :string, :required, "mediaComment" 
    param :string, :date, :dateTime, :required, "date"         
    response :unauthorized
    response :not_found
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing Medium item"
    param :path, :id, :integer, :optional, "Medium Id"
    response :unauthorized
    response :not_found
  end

 
end
