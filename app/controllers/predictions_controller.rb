class PredictionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prediction, only: [:show, :edit, :update, :destroy]
  # before_action :set_match
  # before_action :set_pool

  def index
    @pool = set_pool
    @match = set_match
    if current_user
      @prediction = Prediction.new
      # @predictions = Prediction.all
      else
        flash[:notice] = "You're not logged in"
        redirect_to pool_matches_path(@pool)
    end
  end
  # @prediction = Prediction.new

  def show
  end

  def new
    @match = set_match
    @prediction = Prediction.new
  end

  def edit 
    @match = Prediction.find(params[:id])
    if @match.predictable? == false
      flash[:error] = "You can't edit"
      redirect_to :back
    end
  end

  def create 
    @prediction = set_match.predictions.build(prediction_params.merge(user_id: current_user.id))
    if @prediction.save
      redirect_to pool_matches_path(set_pool),notice: 'Prediction was successfully created.'
    else
      flash[:error]="Prediction not created"
      render 'new'
    end
  end

  def update 
    @pool = set_pool
    @match = set_match
    if @prediction.user == current_user && @prediction.match.predictable? == true 
      if @prediction.update(prediction_params)
        redirect_to pool_matches_predictions(@pool, @match)
      else
        flash[:notice] = "prediction not update"
        render 'edit'
      end
    end
  end

  def destroy
    @pool = set_pool
    @match = set_match
    if current_user.admin == true 
      @prediction.destroy
    else
      flash[:error]="you are not authorized to be here"
      redirect_to pool_matches_predictions(@pool, @match)
    end
  end


  private 

  def set_prediction
    @prediction = Prediction.find(params[:id])
  end

  def set_pool
    @pool = Pool.find(params[:pool_id])
  end

  def set_match 
    @match = Match.find(params[:match_id])
  end

  def prediction_params
    # raise params.inspect
    params.require(:prediction).permit(:score_a, :score_b, :user_id, :match_id)
  end
end
