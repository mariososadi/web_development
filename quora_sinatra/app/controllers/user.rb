get '/login' do

  @validations = params[:error]
  erb :'user/login'

end


post '/login' do

  if params[:email] == "" || params[:password] == ""
    redirect to('/login?error=Please, introduce a valid email adress and password.')
  else
    @user = User.find_by(email: params[:email])
    if User.authenticate(params[:email],params[:password])
      session[:user_id] = @user.id
      redirect '/user' 
    else
      redirect to('/login?error=Incorrect email and password.')
    end  
  end

end



get '/signup' do

  @validations = params[:mess]
  erb :'user/signup'
end


post '/signup' do
   
    if params[:first_name] == "" || params[:last_name] == "" || params[:email] == "" || params[:password] == ""
      redirect to('/signup?mess=0')
    else
      @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
      @user.password = params[:password]
      if @user.save
        session[:user_id] = @user.id
        redirect '/user' 
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

get '/user' do
  redirect_if_not_logged_in
  @user = current_user
  erb :'user/show'
end

get '/user/edit' do
  redirect_if_not_logged_in
  @user = current_user
  erb :'user/profile'
end

post '/user/edit' do
  p "Hola Mundo"
  User.update(params[:_id], :first_name => params[:first_name], :last_name => params[:last_name])
  redirect '/user'
end
