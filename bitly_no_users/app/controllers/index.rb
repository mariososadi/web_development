get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  
  erb :index

end

post '/urls' do

  @short = (0...4).map { (65 + rand(26)).chr }.join.downcase
  @bitly = "http://bitly.com/" + @short

  @url = Urls.new(long_url: params[:url_input], short_url: @short, counter: 0)
  if @url.save
     @urls=Urls.all
     erb :urls
  else
    redirect to ("/")
  end
end

get '/:id' do
     
  @long_url = Urls.find(params[:id]).long_url
  Urls.increment_counter(:counter, params[:id])
  redirect 'http://' + @long_url
  # redirige a la URL original
end


# post '/inicia_sesion' do
#   @user = User.find_by(email: params[:email])
#   if @user.password == params[:password]
#    session[:user_id] = @user.id
#    erb :secret
#   else
#    erb :start
#   end
# end