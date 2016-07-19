get '/' do
  # Look in app/views/index.erb
  erb :register
end

post '/start' do

  Url.create(nick_name: params[:player_1])
  Url.create(nick_name: params[:player_2])

  # validate_url = Url.custom_url?(params[:url_input])
  # if validate_url == 1
  #   @mensaje = "Por favor, introduce una URL válida"
  #   redirect to ("/")
  # else    
  #   @url = 
  #   @urls = Url.all
  #   erb :urls
  # end
end

