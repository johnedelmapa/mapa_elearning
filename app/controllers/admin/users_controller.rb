class Admin::UsersController < ApplicationController

  before_action :logged_in_user
  before_action :admin_user

  def home
  end
end
