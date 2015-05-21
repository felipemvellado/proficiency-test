class ClassroomsController < ApplicationController
  autocomplete :student, :name

  def create
    course = Course.find(params[:course_id])
    student = Student.find(classroom_params[:student_id])
    @classroom = Classroom.new
    @classroom.course = course
    @classroom.student = student

    if @classroom.save
      options = { info: 'Student was added with successfully.' }
      redirect_to @classroom.course, options
    else
      options = { danger: 'Error in adding student to course.' }
      redirect_to course, options
    end

  rescue ActiveRecord::RecordNotFound
    options = { danger: 'Error in adding student to course.' }
    redirect_to course, options
  end

  private

  def classroom_params
    params.require(:classroom).permit(:student, :student_id, :course)
  end
end
