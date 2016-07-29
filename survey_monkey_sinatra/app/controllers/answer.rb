post '/answer/create' do
  @user = current_user
  @answer = Answer.create(user_id: @user.id, question_id: params[:question_id], title: params[:answer])
  params[:question_id]
end
