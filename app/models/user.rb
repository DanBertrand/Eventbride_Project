class User < ApplicationRecord
	after_create :welcome_send
	
	has_many :attendances
	has_many :events, through: :attendances
	has_many :events_administrator, foreign_key: "administrator_id", class_name: "Event"

	validates :first_name, 
		presence: true

	validates :last_name, 
		presence: true

	validates :email, 
		presence: true,
		uniqueness: true,
		format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

	validates :description, 
		presence: true

	validates :encrypted_password, 
		presence: true,
		length: {minimum: 6}

	
	def welcome_send
	  UserMailer.welcome_email(self).deliver_now
	end

end