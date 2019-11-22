class LessonsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.build(user: current_user)

    if @category.words.any? 
      if @lesson.save
        redirect_to new_lesson_answer_url(@lesson)
      end
    else
      flash[:danger] = "No words"
      redirect_to categories_url
    end
  end 

  def show
    @lesson = Lesson.find(params[:id])
  end
end
  