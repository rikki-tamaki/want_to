# coding: utf-8
class UserController < ApplicationController
  def show
    begin
      @user = User.find(params[:id])
    rescue
      flash[:notice] = "ユーザーID #{params[:id]} は存在しません。"
      redirect_to :root and return
    end
  end
end
