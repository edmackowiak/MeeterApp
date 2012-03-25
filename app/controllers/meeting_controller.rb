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

    # deal with the selected checkboxes
    if params[:attendees]
      params[:attendees].each do |a|
        @meeting.attendees.push Attendee.find(a)
      end
    end


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

    @meeting.attendees.reset
    # deal with the selected checkboxes
    if params[:attendees]
      params[:attendees].each do |a|
        @meeting.attendees.push Attendee.find(a)
      end
    end

    @meeting.save

    redirect_to meeting_path( @meeting ), notice: "Successfully updated meeting"
  end

end