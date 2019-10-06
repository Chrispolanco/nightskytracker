class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title 
      t.string  :link 
      t.text    :description 
      t.float   :latitude 
      t.float   :longitude
      t.integer :user_id 
      t.date    :date
    end 
  end
end


class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name 
      t.string  :username 
      t.string  :password_digest
    end 
  end
end
