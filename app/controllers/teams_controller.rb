class TeamsController < ApplicationController
  def index
    @teams = pool.teams
  end

  def new
    @team = pool.teams.build
  end

  def show
    id = params[:id]
    @team = Team.find(id)
  end

  def create
    @team = pool.teams.build(team_params)
    # raise @pool.name.inspect
    if @team.save
      redirect_to pool_teams_path, notice: 'The team was successfully created'
    else
      flash[:error] = "Team has errors"
      render 'new'
    end
  end

  def edit
    @team = pool.teams.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to pool_teams_path, notice: 'The team was successfully update'
    else
      flash[:error] = "team has errors"
      render 'edit'
    end
  end

  def destroy
    id = params[:id]
    @team = Pool.find(id)
    @pool.destroy
    redirect_to pool_teams_path, notice: 'The team was successfully deleted'
  end


  private 

  def pool
    @pool = Pool.find(params[:pool_id])
  end

  def team_params
    params.require(:team).permit(:name,:flag_url,:pool_id)
  end
end
