class Plant < ApplicationRecord
	validates :plant_name presence: true
	validates :plant_type presence: true
	validates :flowering presence: true
	validates :growth_state presence:true
end
