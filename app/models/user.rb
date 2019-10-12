class User < ActiveRecord::Base
   
    has_many :post
    has_secure_password 
    validate :username, :password, :name, presence: true

  end


