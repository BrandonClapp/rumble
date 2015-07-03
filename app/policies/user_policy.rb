class UserPolicy < ApplicationPolicy

  def update?

    if not @user.nil?
      @user.admin? or @user.community_manager? or @user == @record
    else
      false
    end
  end

  def edit?
    update?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
