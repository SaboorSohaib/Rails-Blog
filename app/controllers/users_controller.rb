class UsersController < ApplicationController
  def index
    @id = params[:id]
  end

  def show
    @id = params[:user_id]
  end
end
