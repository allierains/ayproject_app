require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

def create
  begin
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.name}!"
  rescue
    flash[:warning] = "There was an error while trying to authenticate you..."
  end
  redirect_to root_path
end

end