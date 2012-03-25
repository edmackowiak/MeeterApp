class MeetingController < ApplicationController

  def show
    @meeting = Meeting.find(params[:id])

    @active_meeting_id = @meeting.id

    if @meeting.attendees.count > 2
      @pricey_people = @meeting.attendees.find(:all, :limit => 2, :order => 'hourly_rate DESC')
    end
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


    @meeting.cost = 0;

    time_in_hours = ( @meeting.end_time - @meeting.start_time ).abs / 1.hour

    # deal with the selected checkboxes
    if params[:attendees]
      params[:attendees].each do |a,k|
        @att = Attendee.find(a)
        @meeting.attendees.push @att
        @meeting.cost += @att.hourly_rate * time_in_hours
      end
    end


    @meeting.save
    redirect_to dashboard_path, notice: "Successfully created meeting"
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @active_meeting_id = @meeting.id
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.title = params[:title]
    @meeting.date = params[:date]
    @meeting.start_time = params[:start_time]
    @meeting.end_time = params[:end_time]
    @meeting.location = params[:location]
    @meeting.agenda = params[:agenda]

    @meeting.attendees.clear

    @meeting.cost = 0;

    time_in_hours = ( @meeting.end_time - @meeting.start_time ).abs / 1.hour

    # deal with the selected checkboxes
    if params[:attendees]
      params[:attendees].each do |a,k|
        @att = Attendee.find(a)
        @meeting.attendees.push @att
        @meeting.cost += @att.hourly_rate * time_in_hours
      end
    end

    @meeting.save

    redirect_to meeting_path( @meeting ), notice: "Successfully updated meeting"
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.delete

    redirect_to dashboard_path, notice: "Meeting deleted successfully"
  end

end