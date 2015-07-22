class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = CategoryService.index
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = CategoryService.newCategory
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = CategoryService.create

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    CategoryService.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:categoryTitle, :categoryColor, :userId)
    end
    
    
    swagger_controller :categories, "Category Management"

  swagger_api :index do
    summary "Fetches all Category items"
    notes "This lists all the active categories"
    param :query, :page, :integer, :optional, "Page number"
    param :path, :nested_id, :integer, :optional, "Category Id"   
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
    response :requested_range_not_satisfiable
  end

  swagger_api :show do
    summary "Fetches a single Categoy item"
    param :path, :id, :integer, :optional, "Category Id"
    response :ok, "Success", :Category
    response :unauthorized
    response :not_acceptable
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new Category"    
    param :string, :categoryTitle, :string, :required, "categoryTitle"
    param :string, :categoryColor, :string, :required, "categoryColor" 
    param :string, :userId, :string, :required, "userId"   
    response :unauthorized
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing Category"
    param :string, :categoryTitle, :string, :required, "categoryTitle"
    param :string, :categoryColor, :string, :required, "categoryColor"          
    response :unauthorized
    response :not_found
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing Category item"
    param :path, :id, :integer, :optional, "Category Id"
    response :unauthorized
    response :not_found
  end

    
end
