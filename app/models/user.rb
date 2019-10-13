class User < ActiveRecord::Base
   
    has_many :post
    has_secure_password 

    validates :username, :password, presence: true
    validates :password, length: { minimum: 3 }
    validates :username, uniqueness: true
  end


