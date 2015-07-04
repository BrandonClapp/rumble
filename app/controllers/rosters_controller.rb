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

end
