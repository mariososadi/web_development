post '/urls' do

  validate_url = Url.custom_url?(params[:url_input])
  if validate_url == 1
    @mensaje = "Por favor, introduce una URL válida"
    redirect to ("/")
  else    
    @url = Url.create(long_url: params[:url_input])
    @urls = Url.all
    erb :urls
  end
end

get '/:id' do
     
  @long_url = Url.find(params[:id]).long_url
  Url.increment_counter(:counter, params[:id])
  #redirige a la URL original
  redirect @long_url
end