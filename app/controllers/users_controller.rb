class UsersController < ApplicationController
#before_filter :authenticate_user!
before_filter :set_user

  def show
    @user = User.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end

  def update
    
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def edit

  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end