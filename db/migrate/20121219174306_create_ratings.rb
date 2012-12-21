class CreateRatings < ActiveRecord::Migration
  def up
  	create_table :ratings do |t|
  		t.integer :user_id
  		t.integer :manga_id
  		t.integer :rating
  		t.timestamps
  	end
  	add_index :ratings, [:user_id, :manga_id, :rating], :unique => true
  end

  def down
  	drop_table :ratings
  end
end
