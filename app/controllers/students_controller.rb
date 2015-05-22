class StudentsController < ApplicationController
  before_action :find_student, only: %i(show edit update destroy)

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      options = { notice: t("flash.student.create.notice") }
      redirect_to @student, options
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      options = { notice: t("flash.student.update.notice") }
      redirect_to @student, options
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    options = { notice: t("flash.student.delete.notice") }
    redirect_to root_path, options
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :register_number, :status)
  end
end
