class PrivatePagesController < ApplicationController

  include ApplicationHelper

  before_filter :authenticate_user!

  def dashboard
    
  end

end
