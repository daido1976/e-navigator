class InterviewsController < ApplicationController
  before_action :set_user, except: :create
  before_action :correct_user, only: :index

  def index
    @interviews = @user.interviews.order(interview_datetime: :asc)
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      flash[:notice] = "Interview Created!"
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def edit
    @interview = @user.interviews.find(params[:id])
  end

  def update
    @interview = @user.interviews.find(params[:id])
    if @interview.update(interview_params)
      flash[:notice] = "Interview Updated!"
      redirect_to action: "index"
    else
      render "edit"
    end
  end

  def destroy
    @interview = @user.interviews.find(params[:id])
    if @interview.destroy
      flash[:alert] = "Interview Deleted!"
      redirect_to action: "index"
    end
  end

  private
  def interview_params
    params.require(:interview).permit(:interview_datetime).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(authenticated_root_path) unless @user == current_user
  end
end
