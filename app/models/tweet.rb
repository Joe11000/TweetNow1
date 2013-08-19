class Tweet < ActiveRecord::Base
  # Remember to create a migration!
   validates :tweet_id, uniqueness: true
end
