class TrucksController < ApplicationController

	before_action :get_item, only: [:edit, :update, :destroy]

  def get_item
    @truck = Truck.find(params[:id])
  end

  def index
    @title = 'All Trucks'
    @truck = Truck.all.order(:nickname)
  end

  def show
    @truck = Truck.find(params[:id])
    if @truck.nickname != (nil or '')
      @title = @truck.licnum + ' (' + @truck.nickname+')'
    else
      @title = @truck.licnum
    end
    respond_to do |f|
      f.html
      f.json { render json: @truck}
    end
  end

  def edit
    @title = "Edit Truck"
    session[:return_to] = request.referer
  end

  def new
    @title = "New Truck"
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)

    if @truck.save
      redirect_to(trucks_path, notice: 'Truck was created successfully')
    else
      redirect_to(trucks_path, alert: 'Cannot create truck.')
    end
  end

  def update
    @truck = Truck.update(@truck.id, truck_params)

    trailer = Trailer.find(params[:truck][:trailer_id])
    @truck.trailer = trailer
    if @truck.save
      redirect_to(session.delete(:return_to), notice: 'Truck was updated successfully')
      #redirect_to(drivers_path, 
    else
      redirect_to(trucks_path, alert: 'Cannot update truck.')
    end
  end

  def destroy
    @truck.destroy
    redirect_to(trucks_path, notice: 'Truck was deleted successfully')
  end

  

  private
  ## Strong Parameters 
  def truck_params
    params.require(:truck).permit(:nickname, :licnum, :trailer_id)
  end

end
