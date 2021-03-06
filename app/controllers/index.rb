get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:screen_name' do
  @user = TwitterUser.find_by(screen_name: params[:screen_name])

  if (@user.nil?)
    user = TWITTER_CLIENT.user(params[:screen_name])

    @user = TwitterUser.create(screen_name: user.screen_name, display_name: user.name, tweets_count: user.tweets_count)
  end

  erb :tweets
end

post '/fetch' do
  @user = TwitterUser.find_by(screen_name: params["screen_name"])

  if (@user.tweets.size == 0)
    @user.fetch_tweets!
  elsif (@user.tweets_stale?)
    @user.tweets.each {|tweet| tweet.delete}
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)

  erb :tweets_list, layout: false
end

post '/search' do
  redirect "/#{params[:screen_name]}"
end
