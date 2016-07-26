get '/questions/:id/answer/new' do
  redirect_if_not_logged_in
  @question = Question.find(params[:id])
  @user = current_user

  erb :'answers/new'
end

post '/questions/:id/answer/new' do
  @user_post = current_user
  @user=User.all
  @question = Question.find(params[:id])
  @validate_answer = Answer.body?(params[:body])
  if @validate_answer
    @mess = "Please, enter your answer."
    erb :'/answers/new'
  else    
    Answer.create(user_id: @user_post.id, question_id: @question.id, body: params[:body], quest_date: DateTime.now)
    erb :'/questions/id'
  end
end

