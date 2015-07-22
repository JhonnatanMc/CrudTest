class CategoryService
  
  def self.index
     @categories = Category.all
  end
  
  def self.newCategory
    @category = Category.new
  end
  
  def self.create(category_params)
     @category = Category.new(category_params)  
     if @category.save
        @category
     end     
  end
  
  def self.destroy
    @category.destroy
  end
  
end