class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = CommentService.index
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = CommentService.newComment
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = CommentService.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    CommentService.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:description, :date, :mediaId, :recordId)
    end
    
 
 swagger_controller :comments, "Comment Management"

  swagger_api :index do
    summary "Fetches all Comment items"
    notes "This lists all the active comments"
    param :query, :page, :integer, :optional, "Page number"
    param :path, :nested_id, :integer, :optional, "Comment Id"   
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
    response :requested_range_not_satisfiable
  end

  swagger_api :show do
    summary "Fetches a single Comment item"
    param :path, :id, :integer, :optional, "Comment Id"
    response :ok, "Success", :Comment
    response :unauthorized
    response :not_acceptable
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new Comment"    
    param :string, :description, :string, :required, "Description"
    param :string, :date, :dateTime, :required, "Date" 
    param :string, :mediaId, :integer, :required, "mediaId"
    param :string, :recordId, :integer, :required, "recordId"      
    response :unauthorized
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing Comment"
    param :string, :description, :string, :required, "Description"
    param :string, :date, :dateTime, :required, "Date" 
    param :string, :mediaId, :integer, :required, "mediaId"
    param :string, :recordId, :integer, :required, "lrecordId"       
    response :unauthorized
    response :not_found
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing Comment item"
    param :path, :id, :integer, :optional, "Comment Id"
    response :unauthorized
    response :not_found
  end

 
end
