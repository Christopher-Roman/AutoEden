class User < ApplicationRecord
	validates :username presence: true
	validates :user_email presence: true
	validates :country presence: true
end
