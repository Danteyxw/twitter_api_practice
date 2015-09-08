class CreateTweets < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.integer :twitter_user_id, null: false
  		t.string :text, null: false
  		t.timestamps null: false
  	end
  end
end
