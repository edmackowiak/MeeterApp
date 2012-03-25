class PrivatePagesController < ApplicationController

  include ApplicationHelper

  before_filter :authenticate_user!

  def dashboard
    @number_of_meetings = current_user.meetings.count

    @total_cost = 0
    @month_cost = Array.new(12)

    for i in 1..12
      @month_cost[i] = 0
    end

    current_user.meetings.all.each do |m|
      @total_cost += m.cost
      month = m.date.month
      @month_cost[month] += m.cost
    end


  end

end
