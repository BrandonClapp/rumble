class RostersController < ApplicationController

  def remove_user
    @team = Team.find(params[:team_id])
    @roster = @team.rosters.find(params[:roster_id])
    authorize @roster

    @user = @roster.users.find(params[:id])

    if @roster.users.delete(@user)
      redirect_to :back, :notice => "User #{@user.name} removed from the team."
    else
      redirect_to :back, :notice => "Error while removing the user."
    end
  end

  def add_user
    @team = Team.find(params[:team_id])
    @roster = @team.rosters.find(params[:roster_id])
    authorize @roster

    # check to make sure super secret password was right.

    if Membership.create(user: current_user, roster: @roster)
      redirect_to team_path(@team), :notice => "You have successfully joined #{@team.name}'s #{@roster.tournament.league.name} - #{@roster.tournament.name} roster."
    else
      redirect_to :back, :notice => "Error while joining the roster." 
    end

  end

  def join
    @team = Team.find(params[:team_id])
    @roster = @team.rosters.find(params[:roster_id])
    authorize @roster
  end

end
