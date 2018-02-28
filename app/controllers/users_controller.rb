class UsersController < ApplicationController
  def index
    @users = User.where.not(id:current_user.id).order(id: :desc)
  end
end
