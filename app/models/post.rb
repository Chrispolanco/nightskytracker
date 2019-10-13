class Post < ActiveRecord::Base
    belongs_to :user
    validates :title, :link, :description, :latitude, :longitude, :date, presence: true
    validates :password, length: { minimum: 3 }
end

