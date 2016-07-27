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
    @answer = Answer.create(user_id: @user_post.id, question_id: @question.id, body: params[:body], quest_date: DateTime.now)
    AnswerVote.create(answer_id: @answer.id)
    @vote = QuestionVote.find_by(question_id: @question.id)
    redirect '/questions/all_users'
  end
end

get '/answer/:id/plus' do
  redirect_if_not_logged_in
  @answer = Answer.find(params[:id])
  @vote_a = AnswerVote.find_by(answer_id: params[:id])
  AnswerVote.increment_counter(:counter, @vote_a.id)
  redirect back

end

get '/answer/:id/minus' do
  redirect_if_not_logged_in
  @answer = Answer.find(params[:id])
  @vote_a = AnswerVote.find_by(answer_id: params[:id])
  AnswerVote.decrement_counter(:counter, @vote_a.id)
  redirect back

end
