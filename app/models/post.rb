class Post < ActiveRecord::Base
    belongs_to :user
    validates :title, :link, :description, :latitude, :longitude, :date, presence: true
end

