class TeamPolicy < ApplicationPolicy

  def update?
    true
  end

  def edit?
    update?
  end

  def remove_user?
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
