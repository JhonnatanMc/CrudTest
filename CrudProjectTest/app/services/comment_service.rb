class CommentService
  
  def self.index
     @comments = Comment.all
  end
  
  def self.newComment
     @comment = Comment.new
  end
  
  def self.create(comment_params)
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment
    end
  end
  
  def self.destroy
    @comment.destroy
  end
  
end