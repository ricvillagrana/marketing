class RolesController < ApplicationController
  before_action :authenticate_user!
  def index
    @roles = Role.where.not(keyword: ['superadmin', 'admin'])
    render json: { roles: @roles, status: 500 }
  end
end
