class InterviewsController < ApplicationController
  before_action :set_user

  def index
    @interviews = @user.interviews.order(interview_datetime: :asc)
    @users = User.all.where.not(id:current_user.id, name: nil)
  end

  def apply
    @interviewer = User.find(params[:user][:id])
    NotificationMailer.send_when_application(@interviewer, current_user).deliver
    flash[:notice] = "Interview Applied!"
    redirect_to action: "index"
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

  def judgement
    @interview = @user.interviews.find(params[:id])
    if @interview.update(judgement_params)
      NotificationMailer.send_when_confirm(current_user, @user, @interview).deliver
      flash[:notice] = "Interview Comfirm!"
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
    params.require(:interview).permit(:interview_datetime).merge(user_id: @user.id)
  end

  def judgement_params
    params.require(:interview).permit(:judgement)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
