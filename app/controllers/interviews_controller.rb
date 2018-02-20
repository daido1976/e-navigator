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

  end
end
