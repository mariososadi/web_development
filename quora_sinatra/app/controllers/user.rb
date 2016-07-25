get '/login' do
  @validations = params[:error]
  erb :'user/login'
end

get '/signup' do
  @validations = params[:mess]
  erb :'user/signup'
  
end

post '/login' do
  erb :'user/login'
end

post '/signup' do
   
    if params[:first_name] == "" || params[:last_name] == "" || params[:email] == "" || params[:password] == ""
      redirect to('/signup?mess=0')
    else
      @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
      @user.password = params[:password]
      if @user.save
        p session[:user_id] = @user.id
        redirect '/questions' 
      else
        redirect to('/signup?mess=1')
      end  
    end
end

get '/logout' do
  if session[:user_id] != nil
    session.destroy
    redirect to '/login'
  else
    redirect to '/'
  end
end