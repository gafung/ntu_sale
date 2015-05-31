class UsersController < ApplicationController
  def signin?
    !current_user.nil?
  end

  def home
      @users = User.all
      @current_user = session[:current_user]
      @signed_in = !@current_user.nil?
  end

  def login
    @basic_info = User.basic_info_from_fb(request.env['omniauth.auth']['credentials'])
    @friends = User.friends_from_fb(request.env['omniauth.auth']['credentials'])
#    save_to_db(@basic_info)
    @user = User.create fb_id: @basic_info['id'], name: @basic_info['name']
    if !@user.nil?
        flash[:success] = 'This is a new user. Successfully saved.'
    else
        flash[:danger] = 'This user already exists in database. Will not saved again.'
    end
    session[:current_user] ||= @user;
#    render "home"
    redirect_to root_url
    :a
    :q
  end


  def save_to_db(basic_info)
    u = User.new
    u.fb_id = basic_info['id']
    u.name = basic_info['name']
    @save_result = u.save
    @user = u
  end

end
