class MatchesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_pool
  # before_action :set_team
  # before_action :set_match

  def index 
    @matchs = set_pool
    @pool = set_pool.matches
  end

  def show 
    @match = set_match
    @pool = @match.pool
    if current_user #current_user.admin == true
      @prediction = Prediction.new
    else
      flash[:notice] = " CONNECT YOU BEFORE"
      redirect_to user_session
    end
  end

  def new 
    # @match = Match.new
    # if @match.save #current_user.admin == true
    #   redirect_to pool_matches_path
    # else
    #   flash[:error] = "You are not authorize to create a match"
    # end
    # @matchs = Match.all
    @match = set_pool.matches.build
  end

  def edit 
    @match = set_match
    @pool = set_pool
    # @team = set_team
    if current_user #current_user.admin == true
    else
      flash[:error] = "You are not authorized"
      redirect_to pool_match_path(@pool,@match)
    end
  end

  def create 
    #if current_user #current_user.admin == true 
      @match = set_pool.matches.build(match_params)
      # raise set_pool.inspect
      # raise match_params.inspect
      if @match.save 
        redirect_to pool_matches_path, notice:'Match was succesfully created'
      else
        # raise @match.errors.inspect
        flash[:error]= "Match was not created"
        render 'new'
      end
    #end
  end

  def update 
    if current_user #current_user.admin == true 
      @match = set_match
      @pool = set_pool
      if @match.update(match_params)
        redirect_to pool_match_path(@pool,@match),notice:'Match was succesfully updated'
      else 
        flash[:error]="Match was not updated"
        render 'edit'
      end
    else 
      flash[:error]="you are not authorized to be here"
      redirect_to pool_match_path(@pool, @match)
    end
  end

  def destroy
    if current_user #current_user.admin == true
      @match.destroy
      else
        flash[:error]="you are not authorized to be here"
        # redirect_to pool_team_matches_path(@pool, @team, @current_user)
        redirect_to pool_matches_path(@pool, @current_user)
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
