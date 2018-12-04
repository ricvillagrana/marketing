class Superadmin::UsersController < ApplicationController
  before_action :authenticate_user!, :should_be_superadmin!

  def index
    @admins = User.where(role: Role.where(keyword: 'admin').first)
    # @admins.delete nil
    respond_to do |format|
      format.html
      format.json { render json: { admins: @admins, status: 200 }, include: [:user_creation, :company] }
    end
  end

  def create
    user_creation = UserCreation.new
    user_creation.generate_token
    @admin = User.new(user_params)
    @admin.password = user_creation.creation_token
    @admin.role = Role.where(keyword: 'admin').first
    if @admin.save
      user_creation.user = @admin
      user_creation.save

      notification = Notification.new(
        title: "Bienvenido #{@admin.name}",
        message: "Tu cuenta fue creada exitosamente pot #{current_user.fullname}",
        sender: current_user,
        reciever: @admin,
        hotlink: "/profile",
        seen: false
      )
      notification.save
      NotificationsChannel.broadcast_to(@admin.id, notification)

      render json: { user: @admin, link: "#{request.protocol + request.host_with_port}/invited/#{user_creation.creation_token}", status: 200 }
    else
      render json: { errors: @admin.errors, status: 500 }
    end
  end

  def show
    @admin = User.find(params[:id])
    if @admin
      render json: { user: @admin, status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def update
    @admin = User.find(params[:id])
    company = @admin.company
    if @admin.update!(user_params)
      check_company_for_notification(company, @admin.company)
      render json: { user: @admin, status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def check_company_for_notification(company, current_company)
    if company != current_company
      if current_company.nil?
        notification = Notification.new(
          title: "Se te revocó el acceso a la empresa",
          message: "Ahora no administras ninguna",
          sender: current_user,
          reciever: @admin,
          hotlink: "/#{@admin.role.path_prefix}/company",
          seen: false
        )
        notification.save
        NotificationsChannel.broadcast_to(@admin.id, notification)
      else
        notification = Notification.new(
          title: "Se te asignó una nueva empresa",
          message: "Ahora administras #{@admin.company.name}",
          sender: current_user,
          reciever: @admin,
          hotlink: "/#{@admin.role.path_prefix}/company",
          seen: false
        )
        notification.save
        NotificationsChannel.broadcast_to(@admin.id, notification)
      end
    end
  end

  def destroy
    @admin = User.find(params[:id])
    if @admin.destroy
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :username, :born_date, :company_id)
  end
end
