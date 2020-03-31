class Journal < ApplicationRecord
	validates :journal_name presence: true
	validates :journal_type presence: true
end
