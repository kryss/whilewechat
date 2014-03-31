class UsersController < InheritedResources::Base

  def create
    @user = User.new user_params
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def join


  end

private
  def user_params
    params.require(:user).permit(:fullname, :company, :email, :school, :grade, :city, :country, :phone, :about)
  end
end
