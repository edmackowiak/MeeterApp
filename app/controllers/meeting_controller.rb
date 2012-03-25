class MeetingController < ApplicationController

  def show
    @meeting = Meeting.find([:id])
  end

  def new
    @meeting = Meeting.new
  end

  def create

  end

  def edit

  end

  def update

  end

end