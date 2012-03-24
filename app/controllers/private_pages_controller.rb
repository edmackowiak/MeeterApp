class PrivatePagesController < ApplicationController

  before_filter :authenticate_user!

  def dashboard
    @attendees_to_display = current_user.group.attendees
  end
end
