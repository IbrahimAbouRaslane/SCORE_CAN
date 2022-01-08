class PoolsController < ApplicationController
  def index
    @pools = Pool.all
  end

  def new
    @pool = Pool.new()
  end

  def show
    id = params[:id]
    @pool = Pool.find(id)
  end

  def create
    @pool = Pool.create(pool_params)
    # raise @pool.name.inspect
    if @pool.save
      redirect_to pools_path, notice: 'The Pool was successfully created'
    else
      flash[:error] = "Pool has errors"
      render 'new'
    end
  end

  def edit
    @pool = Pool.find(params[:id])
  end

  def update
    @pool = Pool.find(params[:id])
    if @pool.update(pool_params)
      redirect_to pools_path, notice: 'The Pool was successfully update'
    else
      flash[:error] = "Pool has errors"
      render 'edit'
    end
  end

  def destroy
    id = params[:id]
    pool = Pool.find(id)
    pool.destroy
    redirect_to pools_path, notice: 'The Pool was successfully deleted'
  end


  private 

  def pool_params
    params.require(:pool).permit(:name)
  end
end
