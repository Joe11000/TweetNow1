before do 
  @client ||= twitter_client
end

get '/' do
  @users = TwitterUser.all
  erb :index
end

post '/tweet' do
  # if request.xhr?
    @user = TwitterUser.find_or_create_by(username:params[:username])
    @tweets = @user.update(params[:tweet_body])
  # end
end
