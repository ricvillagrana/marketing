class RolesController < ApplicationController
  def index
    @roles = Role.where.not(keyword: ['superadmin', 'admin'])
    render json: { roles: @roles, status: 500 }
  end
end
