class CreatePosts < ActiveRecord::Migration
  
  def change
    create_table :posts do |t|
      t.string  :title 
      t.string  :link 
      t.text    :description 
      t.float   :latitude 
      t.float   :longitude
      t.integer :user_id 
    end 
  end
end
