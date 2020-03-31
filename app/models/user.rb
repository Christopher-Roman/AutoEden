class User < ApplicationRecord
	validates :username, presence: true
	validates :country, presence: true
end
