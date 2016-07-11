get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

get '/start' do
  erb :start
end

get '/secret' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :secret
end

get '/signout' do
  session.destroy
  erb :index
end

get '/register' do
  erb :registration
end

post '/register' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    erb :secret
  else
    redirect to ("/register")
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