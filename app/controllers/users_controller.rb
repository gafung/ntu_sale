class UsersController < ApplicationController

  def signin?
    !@current_user.nil?
  end

  def home
      @users = User.all
      @current_user = session[:current_user]
      if signin?
        @items = Item.all
        cu = User.find(@current_user['id'])
        @re = Reservation.where(user: cu)
        render
      else
        redirect_to auth_provider_url
      end
  end

  def login
    @basic_info = User.basic_info_from_fb(request.env['omniauth.auth']['credentials'])
    @friends = User.friends_from_fb(request.env['omniauth.auth']['credentials'])
    @user = User.create_with(name: @basic_info['name'], photo: @basic_info['picture']['data']['url']).find_or_create_by(fb_id: @basic_info['id']) 
    session[:current_user] ||= @user;
    @signed_in = signin?
    redirect_to root_url
  end

end
