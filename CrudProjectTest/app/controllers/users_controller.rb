class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = UserService.index
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = UserService.newUser
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = UserService.create(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
   respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
     UserService.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:userName, :password, :firstName, :lastName, :email, :verificationCode, :facebookAccount, :linkedInAccount, :createDate)
    end
    
  
      
  swagger_controller :users, "User Management"

  swagger_api :index do
    summary "Fetches all User items"
    notes "This lists all the active users"
    param :query, :page, :integer, :optional, "Page number"
    param :path, :nested_id, :integer, :optional, "User Id"   
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
    response :requested_range_not_satisfiable
  end

  swagger_api :show do
    summary "Fetches a single User item"
    param :path, :id, :integer, :optional, "User Id"
    response :ok, "Success", :User
    response :unauthorized
    response :not_acceptable
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new User"
    param :string, :userName, :string, :required, "userName"
    param :string, :password, :string, :required, "password" 
    param :string, :firstName, :string, :required, "fistName"
    param :string, :lastName, :string, :required, "lastName"
    param :string, :email, :string, :required, "email"
    param :string, :verificationCode, :string , :optional, "verificationCode"
    param :string, :facebookAccount, :string, :optional, "faceBookAccount"
    param :string, :linkedInAccount, :string, :optional, "linkedInAccount"
    param :string, :createDate, :dateTime, :optional, "createDate"   
    response :unauthorized
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing User"
    param :userName, :string, :required, "userName"
    param :password, :string, :required, "password" 
    param :firstName, :string, :required, "fistName"
    param :lastName, :string, :required, "lastName"
    param :email, :string, :required, :optional, "email"
    param :verificationCode, :string ,:optional, "verificationCode"
    param :facebookAccount, :string,  :optional, "faceBookAccount"
    param :linkedInAccount, :string, :optional, "linkedInAccount"        
    response :unauthorized
    response :not_found
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing User item"
    param :path, :id, :integer, :optional, "User Id"
    response :unauthorized
    response :not_found
  end

  # Support for Swagger complex types:
  # https://github.com/wordnik/swagger-core/wiki/Datatypes#wiki-complex-types
  swagger_model :Tag do
    description "A Tag object."
    property :id, :integer, :required, "User Id"
    property :name, :string, :optional, "Name"
  end
  
  
    
end



