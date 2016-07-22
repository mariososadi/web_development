get '/' do
  erb :register
end

post '/start' do

  # Url.create(nick_name: params[:player_1])
  # Url.create(nick_name: params[:player_2])
  erb :index

end

get '/juegos_jugados' do
  erb :juegos_jugados
end

