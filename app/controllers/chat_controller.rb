class ChatController < ApplicationController
  before_action :authenticate_user!

  def users
    users = []
    users = users + current_user.company.users unless current_user.company.nil?
    users = users + current_user.works_on.users unless current_user.works_on.nil?
    respond_to do |format|
      format.html
      format.json { render json: { users: users.flatten }, include: %i[role] }
    end
  end
end
