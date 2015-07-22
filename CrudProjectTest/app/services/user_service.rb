class UserService
  
  def self.index
    @users = User.all
  end
    
  def self.newUser
    @user = User.new
  end
  
  def self.create(user_params)
    @user = User.new(user_params)
    if @user.save
        @user
     end    
  end 
 
  
  def self.destroy
      @user.destroy
  end
  
end