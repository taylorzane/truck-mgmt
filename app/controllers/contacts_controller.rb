class ContactsController < ApplicationController
  
  before_action :get_contact, only: [:edit, :update, :destroy]

  def get_contact
    @contact = Contact.find(params[:id])
  end

  def index
    @title = "All Contacts"
    @contact = Contact.all.order(:username)
  end

  def show
    @contact = Contact.find(params[:id])
    respond_to do |f|
      f.html
      f.json { render json: @contact}
    end
  end

  def new
    @contact = Contact.new
  end

  def edit
    
  end

  def create
    @contact = Contact.new(contact_params)
    #@contact.request = request
    if @contact.save
      redirect_to(contacts_path, notice: 'User was created successfully')
    else
      redirect_to(contacts_path, alert: 'Cannot create user.')
    end
  end

  def update

  end

  def destroy
    @contact.destroy
    redirect_to(contacts_path, notice: "User was deleted successfully")
  end

  

  private
  ## Strong Parameters 
  def contact_params
    params.require(:contact).permit(:name, :pass, :username)
  end

end


=begin
class UsersController < ApplicationController
  ## ...
  def create
    @user = User.new(user_params) ## Invoke user_params method
    if @user.save
      redirect_to @user, notice: 'User was successfully created.' 
    else
      render action: 'new'
    end       
  end
  ## ... 

end 

=end
