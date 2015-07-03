class LeaguePolicy < ApplicationPolicy

  def create?
    @user.community_manager? or @user.admin?
  end

end