class CoursesController < ApplicationController
  before_action :find_course, only: %i(show edit update destroy)

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      options = { notice: 'Course created with successfully.' }
      redirect_to @course, options
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      options = { notice: 'Course was updated with successfully.' }
      redirect_to @course, options
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    options = { notice: 'Course deleted with successfully.' }
    redirect_to root_path
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :status)
  end
end
