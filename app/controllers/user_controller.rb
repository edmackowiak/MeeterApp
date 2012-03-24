class UserController < ApplicationController

  include ApplicationHelper

  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @attendee = @user.attendee

  end

  def edit
    @user = User.find(params[:id])
    @attendee = @user.attendee

  end

  def update
    @user = User.find(params[:id])
    @attendee = @user.attendee

    @attendee.name = params[:name]
    @attendee.position = params[:title]
    @attendee.hourly_rate = params[:hourly_rate]

    @attendee.save

    redirect_to @user, notice: "Successfully updated user."
  end

end