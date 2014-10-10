class DriversController < ApplicationController

	before_action :get_item, only: [:edit, :update, :destroy]

  def get_item
    @driver = Driver.find(params[:id])
  end

  def index
    @title = 'All Drivers'
    @driver = Driver.all.order(:lname)
  end

  def show
    @driver = Driver.find(params[:id])
    @title = @driver.fname + ' ' + @driver.lname
    respond_to do |f|
      f.html
      f.json { render json: @driver}
    end
  end

  def edit
  	@title = 'Edit Driver'
  	session[:return_to] = request.referer
  end

  def new
  	@title = 'Create Driver'
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to(drivers_path, notice: 'Driver was created successfully')
    else
      redirect_to(drivers_path, alert: 'Cannot create driver.')
    end
  end

  def update
  	@driver = Driver.update(@driver.id, driver_params)

    if @driver.save
    	redirect_to(session.delete(:return_to), notice: 'Driver was updated successfully')
      #redirect_to(drivers_path, 
    else
      redirect_to(drivers_path, alert: 'Cannot update driver.')
    end
  end

  def destroy
    @driver.destroy
    redirect_to(drivers_path, notice: 'Driver was deleted successfully')
  end

  

  private
  ## Strong Parameters 
  def driver_params
    params.require(:driver).permit(:fname, :lname, :licnum, :dob, :truck_id)
  end

end
