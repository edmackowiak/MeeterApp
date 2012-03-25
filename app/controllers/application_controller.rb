class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.instance_of?(User)
      
      if ! resource.initialized?
        
        resource.initialized = true;
        # set up starting data
        logger.debug '#### Initializing user'
        resource.group = Group.create
        resource.attendee = Attendee.create
        resource.attendee.email = resource.email
        resource.group.attendees.push resource.attendee
        resource.save

      end

      dashboard_path

    else
      super
    end
  end

end
