post '/answer/create' do
  @user = current_user
  @answer = Answer.create(question_id: params[:survey_id], title: params[:question])
  @answer.id.to_s
end
