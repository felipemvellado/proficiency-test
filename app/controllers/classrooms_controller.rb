class ClassroomsController < ApplicationController
  autocomplete :student, :name, :display_value => :name

  def create
    course = Course.find(params[:course_id])
    student = Student.find(classroom_params[:student_id])
    @classroom = Classroom.new
    @classroom.course = course
    @classroom.student = student

    if @classroom.save
      options = { notice: t("flash.classroom.create.notice") }
      redirect_to @classroom.course, options
    else
      options = { notice: t("flash.classroom.create.error") }
      redirect_to course, options
    end

  rescue ActiveRecord::RecordNotFound
    options = { notice: t("flash.classroom.create.error") }
    redirect_to course, options
  rescue ActiveRecord::RecordNotUnique
    options = { notice: t("flash.classroom.create.not_unique") }
    redirect_to course, options
  end

  private

  def classroom_params
    params.require(:classroom).permit(:student, :student_id, :course)
  end
end
