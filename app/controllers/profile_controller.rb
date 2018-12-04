class ProfileController < ApplicationController
  def index
    @user = current_user
  end

  def user
    respond_to do |format|
      format.html
      format.json { render json: { user: current_user }, include: %i[role campaigns company works_on campaigns_admin] }
    end
  end

  def notifications
    respond_to do |format|
      format.html
      format.json { render json: { notifications: current_user.notifications.order(id: :desc) } }
    end
  end

  def see_notifications
    if current_user.notifications.each { |notification| notification.update!(seen: true) }
      render json: { status: 200 }
    end
  end
end
