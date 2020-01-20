class UsersController < ApplicationController

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def identification
  end

  def log_out
  end

  def card
  end
end
