class ClassroomsController < ApplicationController
  autocomplete :student, :name, :display_value => :name

  def create
    course = Course.find(params[:course_id])
    student = Student.find(classroom_params[:student_id])
    @classroom = Classroom.new
    @classroom.course = course
    @classroom.student = student
    @classroom.entry_at = DateTime.new(
      classroom_params["entry_at(1i)"].to_i,
      classroom_params["entry_at(2i)"].to_i,
      classroom_params["entry_at(3i)"].to_i,
      classroom_params["entry_at(4i)"].to_i,
      classroom_params["entry_at(5i)"].to_i
    )

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
    params.require(:classroom).permit(:student, :student_id, :course, :entry_at)
  end

  def flatten_date_array hash
    %w(1 2 3).map { |e| hash["date(#{e}i)"].to_i }
  end
end
