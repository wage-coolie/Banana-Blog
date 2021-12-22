class User < ActiveRecord::Base

	has_many :articles , dependent: :destroy
	before_save {self.email = email.downcase}
	validates :username , presence: true ,uniqueness: true,
	 length: {minimum: 3 , maximum: 20} 
	 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email , presence: true , uniqueness: true ,
	 length: {minimum: 5 , maximum: 30} , 
	 format: {with: VALID_EMAIL_REGEX }
	 has_secure_password
	 paginates_per 5
end