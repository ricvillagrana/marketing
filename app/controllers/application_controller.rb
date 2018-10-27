class ApplicationController < ActionController::Base
  protect_from_forgery

  def should_be_superadmin!
    redirect_to '/' unless current_user.roles.include?(Role.where(keyword: 'superadmin').first)
  end

  def should_be_admin!
    redirect_to '/' unless current_user.roles.include?(Role.where(keyword: 'admin').first)
  end

  def should_be_communty_manager!
    redirect_to '/' unless current_user.roles.include?(Role.where(keyword: 'cm').first)
  end

  def should_be_designer!
    redirect_to '/' unless current_user.roles.include?(Role.where(keyword: 'designer').first)
  end

  def should_be_content_generator!
    redirect_to '/' unless current_user.roles.include?(Role.where(keyword: 'cg').first)
  end

  def should_be_client!
    redirect_to '/' unless current_user.roles.include?(Role.where(keyword: 'client').first)
  end

end
