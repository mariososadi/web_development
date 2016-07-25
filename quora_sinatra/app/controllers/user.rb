get '/login' do
  erb :'user/login'
end

get '/signup' do
  erb :'user/signup'
end

post '/login' do

  @mess = 'Oops! you enter an invalid username or pasword. Plase, try again.'
  erb :'user/login'
end

post '/signup' do

  p @firstname = params[:first_name]
  p @lastname = params[:last_name]
  p @email = params[:email]
  p @password = params[:password]


  erb :'user/login'
end
