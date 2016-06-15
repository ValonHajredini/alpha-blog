class SessionsController < ApplicationController
  def new

  end
  def create
    @email = params[:session][:email]
  end
  def destroy

  end
end