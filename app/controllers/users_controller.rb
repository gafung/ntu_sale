class UsersController < ApplicationController
  def index
	  @users = User.all
  end

  def home
    @user = User.koala(request.env['omniauth.auth']['credentials'])
    @friends = User.fds(request.env['omniauth.auth']['credentials'])
  end

end
