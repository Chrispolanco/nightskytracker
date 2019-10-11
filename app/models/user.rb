class User < ActiveRecord::Base
    has_secure_password 
    has_many :post
    validates :username, :password, :name, :presence => true 
  end


