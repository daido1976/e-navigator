class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc)
  end
end
