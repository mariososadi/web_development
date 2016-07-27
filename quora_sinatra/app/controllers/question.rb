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
    @question = Question.create(user_id: @user.id, title: params[:title], body: params[:body], quest_date: DateTime.now)
    QuestionVote.create(question_id: @question.id)
    redirect '/user'
  end
end


get '/questions/all_users' do
  redirect_if_not_logged_in
  @answers = Answer.all
  @user = User.all
  @question = Question.all
  erb :'/questions/all'
end


get '/questions/:id' do
  redirect_if_not_logged_in
  @user = User.all
  @question = Question.find(params[:id])
  @vote = QuestionVote.find_by(question_id: @question.id)
  @vote_a = 
  erb :'/questions/id'
end


get '/questions/:id/plus' do
  redirect_if_not_logged_in
  @question = Question.find(params[:id])
  @vote = QuestionVote.find_by(question_id: params[:id])
  QuestionVote.increment_counter(:counter, @vote.id)
  redirect back

end

get '/questions/:id/minus' do
  redirect_if_not_logged_in
  @question = Question.find(params[:id])
  @vote = QuestionVote.find_by(question_id: @question.id)
  QuestionVote.decrement_counter(:counter, @vote.id)
  redirect back

end