class MyPageController < ApplicationController

  before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def update
    bookmark = Bookmark.where(user_id: current_user.id, id: params[:id]).first
    bookmark.start_vpos = params[:start_vpos]
    bookmark.comment = params[:comment]
    bookmark.save
    redirect_to action: 'index'
  end
end
