class Garden < ApplicationRecord
	validates :garden_name presence: true
	validates :garden_type presence: true
	validates :garden_medium presence: true
end
