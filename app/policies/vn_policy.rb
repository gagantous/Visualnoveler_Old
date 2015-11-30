class VnPolicy
  attr_reader :current_user, :model
  
  def initialize(current_user, model)
    @current_user = current_user
    @vn = model
  end

  def index?
    @current_user.admin?
  end

  def simple_create?
    @current_user.admin?
  end

  def edit?
    @current_user.admin?
  end

  def crop?
    @current_user.admin? or @current_user.mod?
  end

  def new?
    @current_user.admin? or @current_user.mod?
  end

  def create?
    @current_user.admin? or @current_user.mod?
  end
  def show?
    return true
  end
  def screenshots?
    @current_user.admin? or @current_user.mod?
  end

  def update?
    @current_user.admin? or @current_user.mod?
  end

  def destroy?
    @current_user.admin?
  end

  
   
end