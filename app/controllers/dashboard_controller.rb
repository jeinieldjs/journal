class DashboardController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @date_today = Date.today
        @categories = current_user.categories.includes(:tasks)
        @tasks_due = @categories.flat_map { |category| category.tasks.where(due_date: @date_today.all_day) }
    end
end
