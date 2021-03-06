class NewsPolicy
  attr_reader :current_user, :model
  
  def initialize(current_user, model)
    @current_user = current_user
    @user = model.user
  end

  def edit?
    @current_user.admin? or @current_user.mod? or @current_user == @user  or @current_user.writer?
  end

  def new?
    @current_user.admin? or @current_user.mod? or @current_user.writer?
  end

  def create?
    @current_user.admin? or @current_user.mod?  or @current_user.writer?
  end
 
  def update?
    @current_user.admin? or @current_user.mod? or @current_user == @user or @current_user.writer?
  end

  def destroy?
    @current_user.admin?
  end

  
   
end