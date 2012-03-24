class PrivatePagesController < ApplicationController

  before_filter :authenticate_user!

  def dashboard
    begin
      @attendees_to_display = current_user.group.attendees
    rescue NoMethodError
      @attendees_to_display = []
    end
  end
end
