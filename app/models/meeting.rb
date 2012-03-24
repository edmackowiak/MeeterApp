class Meeting < ActiveRecord::Base
  has_and_belongs_to_many :attendees
  accepts_nested_attributes_for :user, :group, :attendee
end
