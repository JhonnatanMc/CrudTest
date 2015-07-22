class StatisticsController < ApplicationController
  before_action :set_statistic, only: [:show, :edit, :update, :destroy]

  # GET /statistics
  # GET /statistics.json
  def index
    @statistics = Statistic.all
  end

  # GET /statistics/1
  # GET /statistics/1.json
  def show
  end

  # GET /statistics/new
  def new
    @statistic = Statistic.new
  end

  # GET /statistics/1/edit
  def edit
  end

  # POST /statistics
  # POST /statistics.json
  def create
    @statistic = Statistic.new(statistic_params)

    respond_to do |format|
      if @statistic.save
        format.html { redirect_to @statistic, notice: 'Statistic was successfully created.' }
        format.json { render :show, status: :created, location: @statistic }
      else
        format.html { render :new }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statistics/1
  # PATCH/PUT /statistics/1.json
  def update
    respond_to do |format|
      if @statistic.update(statistic_params)
        format.html { redirect_to @statistic, notice: 'Statistic was successfully updated.' }
        format.json { render :show, status: :ok, location: @statistic }
      else
        format.html { render :edit }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics/1
  # DELETE /statistics/1.json
  def destroy
    @statistic.destroy
    respond_to do |format|
      format.html { redirect_to statistics_url, notice: 'Statistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statistic
      @statistic = Statistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statistic_params
      params.require(:statistic).permit(:date, :logIn, :logOut)
    end
    
    swagger_controller :statistic, "Statistics Management"

  swagger_api :index do
    summary "Fetches all Statistics items"
    notes "This lists all the active Statistics"
    param :query, :page, :integer, :optional, "Page number"
    param :path, :nested_id, :integer, :optional, "Statistic Id"   
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
    response :requested_range_not_satisfiable
  end

  swagger_api :show do
    summary "Fetches a single Statistic item"
    param :path, :id, :integer, :optional, "Statistic Id"
    response :ok, "Success", :Statistic
    response :unauthorized
    response :not_acceptable
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new Statistic"    
    param :string, :date, :string, :required, "Date"
    param :string, :logIn, :dateTime, :required, "LogIn" 
    param :string, :logOut, :dateTime, :required, "LogOut" 
    response :unauthorized
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing Statistic"
    param :string, :date, :string, :required, "Date"
    param :string, :logIn, :dateTime, :required, "LogIn" 
    param :string, :logOut, :dateTime, :required, "LogOut"         
    response :unauthorized
    response :not_found
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing Statistic item"
    param :path, :id, :integer, :optional, "Statistic Id"
    response :unauthorized
    response :not_found
  end

end
