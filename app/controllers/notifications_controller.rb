class NotificationsController < ApplicationController
  after_action :read_notification

  def index
    @notifications = current_user.notifications.all.order(created_at: :desc)
  end

  private

  def read_notification
    @notifications.each do |notification|
      notification.update(read: 1)
    end
  end
end
