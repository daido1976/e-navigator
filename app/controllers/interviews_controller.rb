class InterviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @interviews = @user.interviews.order(id: :desc)
  end

  def new
    @user = User.find(params[:user_id])
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      flash[:success] = "Interview Created!"
      redirect_to action: "index", flash: {success: "Interview Created!"}
    end
  end

  private
  def interview_params
    params.require(:interview).permit(:interview_datetime).merge(user_id: current_user.id)
  end
end
