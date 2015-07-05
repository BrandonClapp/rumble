class RosterPolicy < ApplicationPolicy

  def remove_user?
    return false if @user.nil?

    team_role = @user.role_for(@record)
    if not team_role.nil?
      team_role.intern == :manager
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
