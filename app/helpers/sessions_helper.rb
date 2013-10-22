module SessionsHelper
  def logged_in?
    session[:user_id].present?
  end
  def authenticated!
    unless logged_in?
    redirect_to new_session_path
    end
  end

  # creates a universally accesible user
  # if not already-, do that -> ||=
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end