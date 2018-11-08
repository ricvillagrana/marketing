class FacebookController < ApplicationController
  before_action :authenticate_user!, :should_be_communty_manager!

  require 'open-uri'
  def auth
    @auth = Koala::Facebook::OAuth.new(ENV['facebook_app_id'], ENV['facebook_app_secret_key'], code_callback_url)
    redirect_to @auth.url_for_oauth_code(permissions: permissions)
  end

  def code_callback
    @auth = Koala::Facebook::OAuth.new(ENV['facebook_app_id'], ENV['facebook_app_secret_key'], code_callback_url)

    url = @auth.url_for_access_token(params[:code])
    data = JSON.parse(open(url).read)
    current_user.facebook_access_token = data['access_token']
    current_user.save

    user_api = Koala::Facebook::API.new(current_user.facebook_access_token)
    session["pages-#{current_user.id}"] = user_api.get_object('me/accounts')
    session["user-#{current_user.id}"] = user_api.get_object('me')

    redirect_to('/#_=_')
  end

  def data
    data = {
      pages: session["pages-#{current_user.id}"],
      user: session["user-#{current_user.id}"]
    }
    render json: { facebook_data: data }
  end

  def post
    page_api = Koala::Facebook::API.new(params[:access_token])
    page = page_api.get_object(params[:id])

    publication = page_api.put_connections(params[:id], 'feed', message: params[:content])
    render json: { page: page, publication: publication }
  end

  def code_callback_url
    request.protocol + request.host_with_port + '/facebook/code_callback'
  end

  def permissions
    %i[
      read_audience_network_insights
      read_insights
      manage_pages
      pages_show_list
      pages_manage_cta
      pages_manage_instant_articles
      publish_pages
      read_page_mailboxes

      email
      groups_access_member_info
      publish_to_groups
      user_age_range
      user_birthday
      user_events
      user_friends
      user_gender
      user_hometown
      user_likes
      user_link
      user_location
      user_photos
      user_posts
      user_tagged_places
      user_videos
    ]
  end
end
