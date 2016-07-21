get '/start/login' do
  erb :start
end

get '/secret' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :secret
end

get '/signout/out' do
  session.destroy
  erb :index
end

get '/register/signup' do
  erb :registration
end

post '/register' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
  @user.password = params[:password] #Esto es lo que guarda el password de la forma en el HASH
  if @user.save
    session[:user_id] = @user.id
    erb :index
  else
    redirect to ("/register/signup")
  end
end

#Estas rutas son funcionales, pero no llevan a ningún lugar aún. Necesito trabajarlas más.
post '/inicia_sesion' do
  if User.authenticate(params[:email],params[:password])
    # session[:user_id] = @user.id
    p "hola"
    erb :index
  else
    erb :start
  end

  # @user = User.find_by(email: params[:email])
  # if @user.password == params[:password]
  #  session[:user_id] = @user.id
  #  erb :secret
  # else
  #  erb :start
  # end
end