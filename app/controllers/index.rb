before do 
  @client ||= twitter_client
end

get '/' do
  erb :index
end

post '/tweet' do
  if request.xhr?
    # @client.update(params[:tweet_body])
  else
     debugger
  end

  "<>"
end
