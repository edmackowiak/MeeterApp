class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    @user = current_user
    @attendee = current_user.attendee
  end

end