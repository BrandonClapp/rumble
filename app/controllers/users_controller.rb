class UsersController < ApplicationController
#before_filter :authenticate_user!
before_filter :set_user, except: [:index]

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
      redirect_to user_path(@user), :notice => "User updated."
    else
      redirect_to user_path(@user), :alert => "Unable to update user."
    end
  end

  def edit

  end

  def index

  end

  private

  def secure_params
    params.require(:user).permit(:name, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end

end