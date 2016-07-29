post '/answer/create' do
  @user = current_user
  @answer = Answer.create(user_id: @user.id, question_id: params[:question_id], title: params[:answer])
  params[:question_id]
end

post '/answer/selection' do
  @user = current_user
  Answer.increment_counter(:count, params[:answer_id])
  @answer = params[:answer_id]
end
