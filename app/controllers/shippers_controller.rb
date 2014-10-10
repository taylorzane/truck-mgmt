class ShippersController < ApplicationController

	before_action :get_item, only: [:edit, :update, :destroy]


  def get_item
    @shipper = Shipper.find(params[:id])
  end

  def index
    @title = 'All Shippers'
    @shipper = Shipper.all.order(:name)
  end

  def show
    @shipper = Shipper.find(params[:id])
    @title = @shipper.name
    respond_to do |f|
      f.html
      f.json { render json: @shipper}
    end
  end

  def edit
    @title = "Edit Shipper"
    session[:return_to] = request.referer
  end

  def new
    @title = "New Shipper"
    @shipper = Shipper.new
  end

  def create
    @shipper = Shipper.new(shipper_params)

    if @shipper.save
      redirect_to(shippers_path, notice: 'Shipper was created successfully')
    else
      redirect_to(shippers_path, alert: 'Cannot create shipper.')
    end
  end

  def update
    @shipper = Shipper.update(@shipper.id, shipper_params)

    if @shipper.save
      redirect_to(session.delete(:return_to), notice: 'Shipper was updated successfully')
      #redirect_to(drivers_path, 
    else
      redirect_to(shippers_path, alert: 'Cannot update shipper.')
    end
  end

  def destroy
    @shipper.destroy
    redirect_to(shippers_path, notice: 'Shipper was deleted successfully')
  end

  

  private
  ## Strong Parameters 
  def shipper_params
    params.require(:shipper).permit(:name)
  end

end
