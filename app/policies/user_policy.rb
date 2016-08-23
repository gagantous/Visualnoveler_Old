class UserPolicy
  attr_reader :current_user, :other

  def initialize(current_user, other)
    @current_user = current_user
    @other = other
  end

  def index?
    true
  end

  def crop?
    current_user.admin? or current_user == @user
  end

  def show?
    true
  end

  def update?
    current_user and current_user.admin? or current_user == other
  end

  def destroy?
    current_user and current_user.admin? 
  end

  def edit?
    current_user and current_user.admin? or current_user == other
  end

	 
end