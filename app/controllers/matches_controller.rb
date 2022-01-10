class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pool
  before_action :set_team
  before_action :set_match

  def index 
    @matchs = Match.all
    # @pool = Pool.matchs
  end

  def show 
    @match = set_match
  end

  def new 
    if current_user.admin == true
      @match = Match.new
    else
      flash[:error] = "You are not authorize to create a match"
    end
    @matchs = Match.all
  end

  def edit 
    @pool = set_pool
    @team = set_team
    if current_user.admin == true
    else
      flash[:error] = "You are not authorized"
      redirect_to pool_team_matches_path(@pool, @team, @current_user)
    end
  end

  def create 
    @pool = set_pool
    @team = set_team
    if current_user.admin == true 
      @match = current_user.matchs.build(match_params)
      if @match.save 
        redirect_to pool_team_matches_path(@pool, @team, @current_user), notice:'Match was succesfully created'
      else
        flash[:error]= "Match was not created"
        render 'new'
      end
    end
  end

  def update 
    if current_user.admin == true 
      @match = set_match
      if @match.update(match_params)
        redirect_to pool_team_match_path(@pool, @team, @current_user), notice:'Match was succesfully updated'
      else 
        flash[:error]="Match was not updated"
        render 'edit'
      end
    else 
      flash[:error]="you are not authorized to be here"
      redirect_to pool_team_match_path(@pool, @team, @current_user)
    end
  end

  def destroy
    if current_user.admin == true
      @match.destroy
      else
        flash[:error]="you are not authorized to be here"
        redirect_to pool_team_matches_path(@pool, @team, @current_user)
    end
    
  end 

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def set_pool
    @pool = Pool.find(params[:pool_id])
  end
  def set_team
    @team = Team.find(params[:team_id])
  end

  def match_params
    params.require(:match).permit(:team_a, :team_b, :score_a, :score_b, :team_a_id, :team_b_id, :pool_id, :date)
  end
end
