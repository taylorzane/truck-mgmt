class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    #@contact.request = request
    if @contact.save
      flash.now[:notice] = 'User was created successfully'
    else
      flash.now[:error] = 'Cannot create user.'
      render action: 'show'
    end
  end

  def show
    @contact = Contact.all
  end

  private
  ## Strong Parameters 
  def contact_params
    params.require(:contact).permit(:name, :pass)
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
