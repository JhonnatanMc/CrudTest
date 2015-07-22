class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = RecordService.index
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = RecordService.newRecord
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = RecordService.create(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    RecordService.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:recordTitle, :recordDescription, :startDate, :endDate, :endPresent, :recordPrivacity, :userId, :location)
    end
    
    swagger_controller :reords, "Record Management"

  swagger_api :index do
    summary "Fetches all Record items"
    notes "This lists all the active records"
    param :query, :page, :integer, :optional, "Page number"
    param :path, :nested_id, :integer, :optional, "User Id"   
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
    response :requested_range_not_satisfiable
  end

  swagger_api :show do
    summary "Fetches a single Record item"
    param :path, :id, :integer, :optional, "Record Id"
    response :ok, "Success", :Record
    response :unauthorized
    response :not_acceptable
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new Record"
    param :string, :recordTitle, :string, :required, "recordTitle"
    param :string, :recordDescription, :string, :required, "recordDescription"     
    param :string, :startDate, :dateTime, :required, "startDate"
    param :string, :endDate, :dateTime, :required, "endDate"
    param :string, :endPresent, :string , :optional, "endPresent"
    param :string, :recordPrivacity, :string, :optional, "recordPrivacity"    
    param :string, :userId, :integer, :optional, "userId"  
    param :string, :location, :string, :optional, "location"   
    response :unauthorized
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing Record"
    param :string, :recordTitle, :string, :required, "recordTitle"
    param :string, :recordDescription, :string, :required, "recordDescription"     
    param :string, :startDate, :dateTime, :required, "startDate"
    param :string, :endDate, :dateTime, :required, "endDate"
    param :string, :endPresent, :string , :optional, "endPresent"
    param :string, :recordPrivacity, :string, :optional, "recordPrivacity"    
    param :string, :userId, :integer, :optional, "userId"  
    param :string, :location, :string, :optional, "location"          
    response :unauthorized
    response :not_found
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing Record item"
    param :path, :id, :integer, :optional, "Record Id"
    response :unauthorized
    response :not_found
  end

  
end
