class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :twitter_user
      t.string :body
      t.string :tweet_id, unique: true

      t.timestamps
    end
  end
end
