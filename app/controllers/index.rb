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
  erb :show_tweets
end

post '/create' do
  if TwitterUser.find_by_username(params[:username])
    redirect to "/#{params[:username]}"
  end
  @client.users(params[:username])

  @user = TwitterUser.create(username:params[:username])

  @tweets = @client.user_timeline(params[:username],{count:15})

  @tweets.each do |tweet|
    @user.tweets << Tweet.create(body:tweet.text,tweet_id:tweet.id)
  end
  redirect to "/#{params[:username]}"
end
