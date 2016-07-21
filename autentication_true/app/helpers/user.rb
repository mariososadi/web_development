# helpers do
#   # Esto deberá de regresar al usuario con una sesión actual si es que existe 
#   def current_user
#     session[:user_id] = @user.id
#   end

#   # Regresa true si el current_user existe y false de otra manera 
#   def logged_in?
#   end
# end

helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end
end