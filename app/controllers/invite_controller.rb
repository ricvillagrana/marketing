class InviteController < ApplicationController

  def update
    @user = User.find(params[:id])
    @user.user_creation.destroy
    if @user.update!(user_params)
      render json: { user: @user, status: 200 }
    else
      render json: { errors: @user.errors, status: 500 }
    end
  end

  def edit
    creation = UserCreation.where(creation_token: params[:creation_token]).first
    if creation != nil and !user_signed_in?
      @user = creation.user
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :lastname, :email, :username, :born_date, :password, :password_confirmation)
  end
end
