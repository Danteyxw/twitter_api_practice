class CreateTwitterUsers < ActiveRecord::Migration
  def change
  	create_table :twitter_users do |t|
  		t.string :screen_name, null: false
  		t.string :display_name, null: false
  		t.integer :tweets_count, null: false
  		t.timestamps null: false
  	end
  end
end
