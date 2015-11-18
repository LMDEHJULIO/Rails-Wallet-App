class Card < ActiveRecord::Base
	# still need valid formats
	validates :expiration_month, presence: true, inclusion: {in: 1..12}
	validates :expiration_year, inclusion: {in: (2015..2115)}
	validates :card_type, presence: true
	has_many :user_cards
    has_many :users, through: :user_cards
end
