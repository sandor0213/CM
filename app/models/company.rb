class Company < ApplicationRecord
	validates :title, presence: true
end
