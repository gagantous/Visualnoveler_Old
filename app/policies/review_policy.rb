class ReviewPolicy
  attr_reader :current_user, :model
  
  def initialize(current_user, model)
    @current_user = current_user
    @user = model.user
  end

  def edit?
    @current_user.admin? or @current_user.mod? or @current_user.helper? or @current_user == @user
  end

  def new?
    return true
  end

  def create?
    return true
  end
 
  def update?
    @current_user.admin? or @current_user.mod? or @current_user.helper? or @current_user == @user
  end

  def destroy?
    @current_user.admin? or @current_user.mod? or @current_user.helper? or @current_user == @user
  end

  
   
end