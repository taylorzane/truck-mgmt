class LoadsController < ApplicationController

	before_action :get_item, only: [:edit, :update, :destroy]


  def get_item
    @load = Load.find(params[:id])
  end

  def index
    @title = 'All Loads'
    @load = Load.all.order(:nickname)
  end

  def show
    @load = Load.find(params[:id])
    @title = @load.nickname
    respond_to do |f|
      f.html
      f.json { render json: @load}
    end
  end

  def edit
    @title = "Edit Load"
    session[:return_to] = request.referer
  end

  def new
    @title = "New Load"
    @load = Load.new
  end

  def create
    @load = Load.new(load_params)

    if @load.save
      redirect_to(loads_path, notice: 'Load was created successfully')
    else
      redirect_to(loads_path, alert: 'Cannot create load.')
    end
  end

  def update
    @load = Load.update(@load.id, load_params)

    if @load.save
      redirect_to(session.delete(:return_to), notice: 'Load was updated successfully')
      #redirect_to(drivers_path, 
    else
      redirect_to(loads_path, alert: 'Cannot update load.')
    end
  end

  def destroy
    @load.destroy
    redirect_to(loads_path, notice: 'Load was deleted successfully')
  end

  

  private
  ## Strong Parameters 
  def load_params
    params.require(:load).permit(:nickname, :length, :width, :height, :weight, :trailer_id, :shipper_id)
  end

end
