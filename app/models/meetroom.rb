class Meetroom < ApplicationRecord
	has_many :reservations, dependent: :destroy

	validates :number, :title, presence: true
	validates :number, numericality: {only_integer: true}
end
