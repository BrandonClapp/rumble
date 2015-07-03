class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
    authorize @league
  end

  def create
    @league = League.new(league_params)
    authorize @league

    if @league.save
      redirect_to league_path(@league)
    else
      render 'new'
    end
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end
end
