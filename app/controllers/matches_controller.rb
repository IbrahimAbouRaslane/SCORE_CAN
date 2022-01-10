class MatchesController < ApplicationController
<<<<<<< HEAD
  # before_action :authenticate_user!
  # before_action :set_pool
  # before_action :set_team
  # before_action :set_match

  def index 
    # @matches = Match.all
    @pool = set_pool
    @matches= set_pool.matches
=======
  before_action :authenticate_user!
  before_action :set_pool
  before_action :set_team
  before_action :set_match

  def index 
    @matchs = Match.all
    # @pool = Pool.matchs
>>>>>>> a6023fa6c789c99af00c1c8487e49ab02f406d18
  end

  def show 
    @match = set_match
  end

  def new 
<<<<<<< HEAD
    # @match = Match.new
    # if @match.save #current_user.admin == true
    #   redirect_to pool_matches_path
    # else
    #   flash[:error] = "You are not authorize to create a match"
    # end
    # @matchs = Match.all
    @match = set_pool.matches.build
=======
    if current_user.admin == true
      @match = Match.new
    else
      flash[:error] = "You are not authorize to create a match"
    end
    @matchs = Match.all
>>>>>>> a6023fa6c789c99af00c1c8487e49ab02f406d18
  end

  def edit 
    @pool = set_pool
    @team = set_team
    if current_user.admin == true
    else
      flash[:error] = "You are not authorized"
<<<<<<< HEAD
      redirect_to pool_matches_path(@pool)
=======
      redirect_to pool_team_matches_path(@pool, @team, @current_user)
>>>>>>> a6023fa6c789c99af00c1c8487e49ab02f406d18
    end
  end

  def create 
<<<<<<< HEAD
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
=======
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
>>>>>>> a6023fa6c789c99af00c1c8487e49ab02f406d18
  end

  def update 
    if current_user.admin == true 
      @match = set_match
      if @match.update(match_params)
<<<<<<< HEAD
        redirect_to pool_matches_path(@pool, @current_user),notice:'Match was succesfully updated'
=======
        redirect_to pool_team_match_path(@pool, @team, @current_user), notice:'Match was succesfully updated'
>>>>>>> a6023fa6c789c99af00c1c8487e49ab02f406d18
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
<<<<<<< HEAD
    if current_user #current_user.admin == true
      @match.destroy
      else
        flash[:error]="you are not authorized to be here"
        # redirect_to pool_team_matches_path(@pool, @team, @current_user)
        redirect_to pool_matches_path(@pool, @current_user)
=======
    if current_user.admin == true
      @match.destroy
      else
        flash[:error]="you are not authorized to be here"
        redirect_to pool_team_matches_path(@pool, @team, @current_user)
>>>>>>> a6023fa6c789c99af00c1c8487e49ab02f406d18
    end
    
  end 

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def set_pool
<<<<<<< HEAD
    @pool = Pool.find(params[:pool_id])
  end
  def set_team
    @team = Team.find(params[:team_id])
  end

  def match_params
    params.require(:match).permit(:team_a, :team_b, :score_a, :score_b, :team_a_id, :team_b_id, :pool_id, :date)
=======
    @pool = Pool.find(params[:id])
  end
  def set_team
    @team = Team.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:team_a, :team_b, :score_a, :score_b, :team_a_id, :team_b_id)
>>>>>>> a6023fa6c789c99af00c1c8487e49ab02f406d18
  end
end
