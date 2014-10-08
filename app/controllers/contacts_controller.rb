class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.save
      flash.now[:notice] = 'User was created successfully'
    else
      flash.now[:error] = 'Cannot create user.'
      render action: 'new'
    end
  end


  private
  ## Strong Parameters 
  def contact_params
    params.require(:user).permit(:name, :pass)
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
