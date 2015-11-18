class User < ActiveRecord::Base
	validates :fname, presence: true 
	validates :lname, presence: true 
	validates :email, presence: true, uniqueness: true 
	# , uniqueness: { message: "Your email is not unique."}
	validates :password, presence: true, length: {minimum: 5}
	validates :balance, numericality: { greater_than_or_equal_to: 0}
	# validates :email_format_should_contain_at_sign
	# before_save :format_phone_number

	has_many :user_cards
	has_many :cards, through: :user_cards


end
