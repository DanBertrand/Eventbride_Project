class Attendance < ApplicationRecord
	belongs_to :user
	belongs_to :event

	after_create :joining_event_send


	def joining_event_send
	    AttendanceMailer.joining_event_email(self).deliver_now
	end
end