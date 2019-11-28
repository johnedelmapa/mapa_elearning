class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)
    @lesson = Lesson.new
    @user = User.find(current_user.id)
    @status = params[:status]
    
    if @status == "1"
      @categories =  @user.categories.paginate(page: params[:page], per_page: 10)
    elsif @status == "0"
        @categories = @categories.where.not(id:  @user.category_ids).paginate(page: params[:page], per_page: 10)
    end
  end
end
