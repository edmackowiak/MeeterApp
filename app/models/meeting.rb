class Meeting < ActiveRecord::Base
  has_and_belongs_to_many :attendees
  belongs_to :user
  #accepts_nested_attributes_for :attendee
end
