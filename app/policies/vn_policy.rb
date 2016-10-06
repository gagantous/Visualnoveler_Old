class VnPolicy
  attr_reader :current_user, :model
  
  def initialize(current_user, model)
    @current_user = current_user
    @vn = model
  end

  def index?
    @current_user.admin?
  end

  def edit_walkthrough?
    @current_user.admin? or @current_user.mod? or @current_user.helper?
  end

  def edit?
    @current_user.admin? or @current_user.mod? or @current_user.helper?
  end

  def crop?
    @current_user.admin? or @current_user.mod? or @current_user.helper?
  end

  def new?
    @current_user.admin? or @current_user.mod? or @current_user.helper?
  end

  def create?
    @current_user.admin? or @current_user.mod? or @current_user.helper?
  end
  def show?
    return true
  end
  def screenshots?
    @current_user.admin? or @current_user.mod? or @current_user.helper?
  end

  def update?
    @current_user.admin? or @current_user.mod? or @current_user.helper?
  end

  def destroy?
    @current_user.admin?
  end

  
   
end