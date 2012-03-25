class MeetingController < ApplicationController

  def show
    @meeting = Meeting.find(params[:id])
  end


  def create
    @meeting = Meeting.new
    @meeting.title = params[:title]
    @meeting.date = params[:date]
    @meeting.start_time = params[:start_time]
    @meeting.end_time = params[:end_time]
    @meeting.location = params[:location]
    @meeting.agenda = params[:agenda]

    @meeting.user = current_user

    @meeting.save
    redirect_to dashboard_path, notice: "Successfully created meeting"
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.title = params[:title]
    @meeting.date = params[:date]
    @meeting.start_time = params[:start_time]
    @meeting.end_time = params[:end_time]
    @meeting.location = params[:location]
    @meeting.agenda = params[:agenda]

    @meeting.save

    redirect_to meeting_path( @meeting ), notice: "Successfully updated meeting"
  end

end