get '/questions' do
  redirect_if_not_logged_in
  @user = current_user
  erb :'questions/show'
end

 get '/questions/new' do
  redirect_if_not_logged_in
  @user = current_user
  erb :'/questions/new'
end


