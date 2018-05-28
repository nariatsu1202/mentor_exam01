class RailsExamController < ApplicationController
  def index
  end

  def errors
    @authors = Author.created_after("2018-01-01 00:00:00").includes(:books)
  end

  def backend
    @authors = Author.all.includes(:books)
  end

  def backend02
    @book = Book.new
  end
end
