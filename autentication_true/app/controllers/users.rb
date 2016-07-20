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
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    erb :secret
  else
    redirect to ("/register/signup")
  end
end

post '/inicia_sesion' do
  @user = User.find_by(email: params[:email])
  if @user.password == params[:password]
   session[:user_id] = @user.id
   erb :secret
  else
   erb :start
  end
end