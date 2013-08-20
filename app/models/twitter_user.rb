class TwitterUser < ActiveRecord::Base
  has_many :tweets
 

  def fetch_tweets!
    if !self.stale? && !self.tweets.empty?
      return self.tweets
    else
      self.touch
      @tweets = twitter_client.user_timeline(self.username,{count:15})
      self.tweets = []
      @tweets.each do |tweet|
        self.tweets << Tweet.create(body:tweet.text,tweet_id:tweet.id)
      end
    end
    self.tweets
  end

  def stale?
    age = (Time.now - self.updated_at)/ 60
    age > 15 # minutes
  end
end
