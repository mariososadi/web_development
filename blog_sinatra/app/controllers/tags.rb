get '/tag/:nombre_tag' do #Esto sirve para "cachar" las variables en rutas
  @cosa = params[:nombre_tag]
  @tag = Tag.find_by(name: @cosa)
  erb :tags
end
