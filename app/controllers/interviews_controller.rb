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
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @interview = @user.interviews.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @interview = @user.interviews.find(params[:id])
    if @interview.update(interview_params)
      flash[:success] = "Interview Updated!"
      redirect_to action: "index", flash: {success: "Interview Created!"}
    else
      render "edit"
    end
  end

  private
  def interview_params
    params.require(:interview).permit(:interview_datetime).merge(user_id: current_user.id)
  end
end
