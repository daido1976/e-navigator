class InterviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @interviews = @user.interviews.order(id: :desc)
  end

  def new
  end

  def create

  end
end
