class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin?
  end

  def crop?
    @current_user.admin? or @current_user == @user
  end

  def show?
    return true
  end

  def update?
    @current_user.admin? or @current_user == @user
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end

  def wishlist?
  	return true
  end

  def favourite?
  	return true
  end

  def drop?
  	return true
  end

  def completed?
  	return true
  end

  def watch?
  	return true
  end

	 
end