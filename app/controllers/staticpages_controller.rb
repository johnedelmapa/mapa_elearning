class StaticpagesController < ApplicationController
  def home
    if logged_in?
      user = User.find(current_user.id)
      @feeds = Activity.where("user_id IN (?) OR user_id = ?", user.following_ids, user.id).paginate(page: params[:page], per_page:8)
      render 'users/dashboard_feeds'
    end
  end

  def about
  end
end
