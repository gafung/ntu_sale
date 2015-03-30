class UsersController < ApplicationController
  def index

  end

  def login
    @user = User.koala(request.env['omniauth.auth']['credentials'])
    @friends = User.fds(request.env['omniauth.auth']['credentials'])
  end
end
