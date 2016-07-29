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

get '/survey/all/:id' do
  redirect_if_not_logged_in
  
  
end

