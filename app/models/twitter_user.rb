class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
  	tweets = TWITTER_CLIENT.search("from:#{self.screen_name}", result_type: 'recent').take(10)
  
  	tweets.each do |tweet|
  		self.tweets.create(text: tweet.text)
  	end
  end

  def tweets_stale?
  	user = TWITTER_CLIENT.user(self.screen_name)

  	if (user.tweets_count != self.tweets_count)
  		return true
  	end
  	false
  end
end
