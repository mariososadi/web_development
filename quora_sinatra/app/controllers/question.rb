get '/questions/new' do
  redirect_if_not_logged_in
  erb :'/questions/new'
end


post '/questions/new' do
  @user = current_user
  @validate_question = Question.title?(params[:title])
  if @validate_question
    @mess = "Please, enter your question. Complementary text is not mandatory."
    erb :'/questions/new'
  else    
    Question.create(user_id: @user.id, title: params[:title], body: params[:body], quest_date: DateTime.now)
    redirect '/questions/user'
  end
end

get '/questions/all_users' do
  redirect_if_not_logged_in
  @answers = Answer.all
  @user = User.all

  erb :'/questions/all'
end

get '/questions/:id' do
  redirect_if_not_logged_in
  @user = User.all
  @question = Question.find(params[:id])
  erb :'/questions/id'
end

