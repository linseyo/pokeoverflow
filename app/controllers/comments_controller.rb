
get '/questions/:commentable_id/comments/new' do
  @question_id = params[:commentable_id]
  erb :'comments/new'
end

# The resource is comment hence COMMENTS CONTROLLER
post '/questions/:commentable_id/comments' do
  Comment.create!(content: params['content'],
    commentable_id: params[:commentable_id],
    user_id: session[:user_id],
    commentable_type: "Question")
  redirect to "/questions/#{params[:commentable_id]}"
end

# Todo: determine restful routing for comments