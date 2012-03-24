class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.instance_of?(User)
      dashboard_path

      if !resource.attendee?
         # do some data setup
        resource.group = Group.create
        resource.attendee = Attendee.create
        resource.attendee.email = resource.email
        resource.group.attendees.push resource.attendee
      end
    else
      super
    end
  end

end
