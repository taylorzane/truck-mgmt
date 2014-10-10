class TrailersController < ApplicationController

  before_action :get_item, only: [:edit, :update, :destroy]

  def get_item
    @trailer = Trailer.find(params[:id])
  end

  def index
    @title = 'All Trailers'
    @trailer = Trailer.all.order(:licnum)
  end

  def show
    @trailer = Trailer.find(params[:id])
    if @trailer.nickname != (nil or '')
      @title = @trailer.licnum + ' (' + @trailer.nickname+')'
    else
      @title = @trailer.licnum
    end
    respond_to do |f|
      f.html
      f.json { render json: @trailer}
    end
  end

  def edit
    @title = "Edit Trailer"
    session[:return_to] = request.referer
  end

  def new
    @title = "New Trailer"
    @trailer = Trailer.new
  end

  def create
    @trailer = Trailer.new(trailer_params)

    if @trailer.save
      redirect_to(trailers_path, notice: 'Trailer was created successfully')
    else
      redirect_to(trailers_path, alert: 'Cannot create trailer.')
    end
  end

  def update
    @trailer = Trailer.update(@trailer.id, trailer_params)

    if @trailer.save
      redirect_to(session.delete(:return_to), notice: 'Trailer was updated successfully')
      #redirect_to(drivers_path, 
    else
      redirect_to(trailers_path, alert: 'Cannot update trailer.')
    end
  end

  def destroy
    @trailer.destroy
    redirect_to(trailers_path, notice: 'Trailer was deleted successfully')
  end

  

  private
  ## Strong Parameters 
  def trailer_params
    params.require(:trailer).permit(:nickname, :licnum, :length, :width, :height, :truck_id)
  end

end
