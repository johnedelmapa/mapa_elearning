class StaticpagesController < ApplicationController
  def home
    if logged_in?
      render 'users/dashboard_feeds'
    end
  end

  def about
  end
end
