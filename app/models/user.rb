class User < ActiveRecord::Base
   
    has_many :post
    has_secure_password 

    validates :username, :password, :name, presence: true
    validates :password, length: { minimum: 3 }
    validates :email, uniqueness: true
  end


