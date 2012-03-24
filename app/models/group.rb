class Group < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :attendees
  accepts_nested_attributes_for :user, :attendees
end
