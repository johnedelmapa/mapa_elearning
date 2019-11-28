class WordsController < ApplicationController
  def index
    @answers = current_user.answers.paginate(page: params[:page], per_page: 5)
  end
end
