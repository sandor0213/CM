class Meetroom < ApplicationRecord
	has_many :reservations, dependent: :destroy
end
