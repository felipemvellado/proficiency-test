class CoursesController < ApplicationController
  before_action :find_course, only: %i(edit update destroy)

  def index
    @courses = Course.all.recent
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      options = { notice: t("flash.course.create.notice") }
      redirect_to @course, options
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      options = { notice: t("flash.course.update.notice") }
      redirect_to @course, options
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    options = { notice: t("flash.course.delete.notice") }
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
