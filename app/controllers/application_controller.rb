class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.instance_of?(User)
      dashboard_path
    else
      super
    end
  end
end
