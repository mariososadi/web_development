get '/' do
  @abuelita = params[:abuelita]
  
  erb :index
  # Visita app/views/index.erb
end


post '/abuelita' do
  user_input = params[:user_input]
  user_input.to_s

  a = true 
  user_input.each_char { |x| a = false if x != x.upcase }
  if a == true
    if user_input == "BYE"
      # @abuelita = 
      "CUÍDATE HIJO, NOS VEMOS DESPUÉS"
    else
     # @abuelita = 
     "NO, NO DESDE 1983"
    end
  else
     # @abuelita = 
     "¡¿HUH?! ¡NO TE ESCUCHO, HIJO!"
  end

  # erb :index

end

