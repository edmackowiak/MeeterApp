class Attendee < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :meetings
  has_and_belongs_to_many :groups

  accepts_nested_attributes_for :user, :groups, :meetings
end
