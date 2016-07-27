get '/photos/upload' do
  redirect_if_not_logged_in
  erb :'/photo/new'
end


post '/photos/upload' do
  @user = current_user
  @photo = Photo.new(params[:photo])
  @photo.save!
  @photo.update(user_id: @user.id)
  redirect '/photos/all'

end


get '/photos/all' do
  erb :'/photo/all'
end

