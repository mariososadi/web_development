post '/question/create' do
  @user = current_user
  @question = Question.create(survey_id: params[:survey_id], title: params[:question])
  @question.id.to_s
end


