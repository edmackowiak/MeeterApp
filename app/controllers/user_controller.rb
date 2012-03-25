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
    @attendee.hourly_rate = params[:hourly_rate].gsub(",", "").to_f
    @attendee.email = @user.email

    @attendee.save
    @user.save

    redirect_to @user, notice: "Successfully updated user."
  end

  def create
    @attendee = Attendee.new
    @attendee.name = params[:name]
    @attendee.position = params[:title]
    @attendee.hourly_rate = params[:hourly_rate].gsub(",", "").to_f
    @attendee.email = params[:email]

    current_user.group.attendees.push @attendee 
    @attendee.save
    @attendee.user.save

    redirect_to dashboard_path, notice: "Successfully updated user."
  end

end