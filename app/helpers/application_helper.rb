module ApplicationHelper
  def body_classes
      @body_classes ||= [controller.controller_name, controller.action_name]
      @body_classes << 'admin' if request.path.starts_with? "/admin"
      return @body_classes
  end

  def get_attendees_to_display
    begin
      @attendees_to_display = current_user.group.attendees
    rescue NoMethodError
      @attendees_to_display = []
    end

    return @attendees_to_display
  end
    
end
