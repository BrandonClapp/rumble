class TeamPolicy < ApplicationPolicy

  def new?
    create?
  end

  def create?
    
  end

  def update?
    true
  end

  def edit?
    update?
  end

  # def remove_user?
  #   if not @user.nil?
  #     @user.admin? or @user.community_manager?
  #   else
  #     false
  #   end
  # end

  def join_team?

    # scope team at tournament level?

    # is this user already part of this team?
    part_of_team = @user.teams.include? @record

    # is this user already a part of a team that is in this tournament?
    team_tournaments = @record.tournaments
    user_teams_in_tournament = team_tournaments & @user.teams

    !part_of_team and user_teams_in_tournament.empty?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
