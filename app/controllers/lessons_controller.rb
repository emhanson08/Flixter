class LessonsController < ApplicationController
  before_action :authenticate_user!
   #redirect user to root_url with an error message if they are not enrolled in the course

  def show
    if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to root_url, alert: "You are not enrolled in this course"
    end
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
