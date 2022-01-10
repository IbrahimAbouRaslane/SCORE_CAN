class PredictionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_predictions, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @predictions = current_user.predictions
      else
        flash[:notice] = "You're not logged in"
        redirect_to pool_matches_path(@pool)
      end
  end
  # @predictions = Prediction.all

  def show
  end

  def new
    @match = set_match
    @prediction = Prediction.new
  end

  def edit 
    @match = Prediction.find(params[:id]).match
    if @match.predictable? == false
      flash[:error] = "You can't edit"
      redirect_to :back
    end
  end

  def create 
    @prediction = set_match.predictions.build(prediction_params)
    if @prediction.save
      redirect_to pool_match_predictions(@pool, @match)
  end


  private 

  def set_match 
    @match = Match.find(params[:match_id])
  end

  def prediction_params
    params.require(:prediction).permit(:score_a, :score_b, :user_id, :match_id)
  end
end
