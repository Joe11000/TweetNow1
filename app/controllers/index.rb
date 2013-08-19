before do 
  @client ||= twitter_client
end

get '/' do
  @users = TwitterUser.all
  erb :create_user
end

get '/:username' do
  @user = TwitterUser.find_by_username(params[:username])
  if @user.stale?
    # User#fetch_tweets! should make an API call
    # and populate the tweets table
    #
    # Future requests should read from the tweets table 
    # instead of making an API call
    @user.fetch_tweets!
  end

  @tweets = @user.tweets
  erb :_tweet_list_partial
end

post '/tweets' do
  if request.xhr?
    @user = TwitterUser.find_or_create_by(username:params[:username])
    @tweets = @user.fetch_tweets!
    erb :_tweet_list_partial, layout: false
  end
end
