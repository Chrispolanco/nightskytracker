class Post < ActiveRecord::Base
    belongs_to :user
    validate :title, :link, :description, :latitude, :longitude, :date, presence: true
end

