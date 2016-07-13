get '/' do
 
  erb :index

end

get '/urls' do

  erb :urls

end


post '/urls' do

  validate_url = Urls.custom_url?(params[:url_input])
  if validate_url == 1
    @mensaje = "Por favor, introduce una URL válida"
    redirect to ("/")
  else    
    @url = Urls.create(long_url: params[:url_input])
    @urls = Urls.all
    erb :urls
  end
end

get '/:id' do
     
  @long_url = Urls.find(params[:id]).long_url
  Urls.increment_counter(:counter, params[:id])
  #redirige a la URL original
  redirect @long_url
end

