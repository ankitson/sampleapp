class UsersController < ApplicationController

  def new
    @user = User.new
    @title = "Sign Up"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success]= "Welcome to the Sample App!"
      redirect_to @user
      #Handle a successful save
    else
      @title = "Sign up"
      @user.password = nil
      @user.password_confirmation = nil
      render 'new'
    end
  end
end

