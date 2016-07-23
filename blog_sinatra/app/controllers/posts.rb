get '/post' do
  erb :post
end

get '/post/new' do
  erb :new
end

post '/post/new' do
  @tags = params[:post_tags].delete(' ').split(',')
  
  @validate_post = Post.title_body?(params[:title], params[:body])
  if @validate_post
    @mensaje = "Por favor, introduce un título y contenido"
    erb :new
  else    
    @post = Post.create(title: params[:title], body: params[:body], post_date: DateTime.now)
    @tags.each do|x| 
      @find_tag = Tag.find_by(name: x)
    if @find_tag
      List.create(post_id: @post.id, tag_id: @find_tag.id)
    else
      @tag = Tag.create(name: x)
      List.create(post_id: @post.id, tag_id: @tag.id)
    end
    end
    erb :post
  end

end

get '/post/:id_post' do
   @post_view = Post.find(params[:id_post])
  erb :post_id

end

get '/post/:id_post/delete' do
  @post_delete = params[:id_post]
  erb :delete
 end

post '/post/delete' do
  Post.destroy(params[:_method])
  List.find_by(post_id: params[:_method]).destroy
  erb :post
end

get '/post/:id_post/edit' do
  @post_edit = Post.find(params[:id_post])
  erb :edit  
end

post '/post/edit' do
  Post.update(params[:_method], :title => params[:title], :body => params[:body])
  erb :post
end