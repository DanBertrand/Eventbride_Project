class Event < ApplicationRecord
	
	belongs_to :administrator, class_name: "User"
	has_many :attendances
	has_many :users, through: :attendances


	validate :start_date_cannot_be_in_the_past, :duration_format


	validates :start_date, 
		presence: true 

	validates :duration, 
		presence: true,
		numericality: { only_integer: true, greater_than: 0}

	validates :title, 
		presence: true,
		length: {in: 5..140}

	validates :description, 
		presence: true,
		length: {in: 20..1000}

	validates :price, 
		presence: true,
		numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000}

	validates :location,
		presence: true



	def start_date_cannot_be_in_the_past
	  if start_date < Date.today
	    errors.add(:start_date, "Start date of the event cannot be in the past")
	  end
	end

	def duration_format
	  if duration % 5 != 0
	    errors.add(:duration, "Must be positive integer, multiple of 5")
	  end
	end


end
