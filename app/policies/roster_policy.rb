class RosterPolicy < ApplicationPolicy

  def remove_user?
    is_manager?
  end

  def add_user?
    join?
  end

  def join?
    #user doesn't exist on this roster
    return false if @user.nil?

    already_member = @record.users.include? @user

    #user doesn't belong to any other roster in this tournament.

    not already_member
  end

  private

  def is_manager?
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
