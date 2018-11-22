class CompaniesController < ApplicationController
  before_action :authenticate_user!
  def users
    @users = current_user.works_on.users
    respond_to do |format|
      format.html
      format.json { render json: { users: @users }, include: %i[role] }
    end
  end
end
