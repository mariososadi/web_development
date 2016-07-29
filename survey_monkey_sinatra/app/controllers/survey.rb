post '/survey/:id/create' do
  @validate_title = Survey.title?(params[:title])
  if @validate_title
    @user = current_user
    @mess = "Please, enter a title for your survey."
    erb :'user/show'
  else
    @user = current_user     
    @survey = Survey.create(title: params[:title], surv_date: DateTime.now)
    Record.create(user_id: params[:id],survey_id: @survey.id, responder: 1)
    erb :'survey/new'
  end
end

get '/survey/all' do
  redirect_if_not_logged_in
  @user = User.all
  @survey = Survey.all
  @record = Record.all
  
  erb :'survey/all'  
end

get '/survey/all/:id' do
  redirect_if_not_logged_in
  @user = current_user
  @survey = Survey.find(params[:id])
  @answer = Answer.all  
  erb :'survey/id'
end

post '/survey/taken' do
  @user = current_user
  Record.create(user_id: @user.id,survey_id: params[:survey_id])
end

get '/survey/stats/:id' do
  redirect_if_not_logged_in
  @user = current_user
  @survey = Survey.find(params[:id])
  @question = Question.all
  @answer = Answer.all
  erb :'survey/stats'  
end

