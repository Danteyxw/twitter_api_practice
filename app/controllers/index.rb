get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  @tweets = TWITTER_CLIENT.search("from:#{params[:username]}", result_type: 'recent').take(2)

  # tweet.user.screen_name
  # tweet.text
  erb :tweets
end

post '/search' do
  redirect "/#{params[:username]}"
end