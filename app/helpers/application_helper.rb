module ApplicationHelper
    def body_classes
        @body_classes ||= [controller.controller_name, controller.action_name]
        @body_classes << 'admin' if request.path.starts_with? "/admin"
        return @body_classes
    end
end
