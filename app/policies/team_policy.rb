class TeamPolicy < ApplicationPolicy

  def update?
    true
  end

  def edit?
    update?
  end

  def remove_user?
    if not @user.nil?
      @user.admin? or @user.community_manager?
    else
      false
    end
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
