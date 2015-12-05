class MyPageController < ApplicationController

  before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def update
    bookmark = Bookmark.find(current_user.id)
    if bookmark.update(:start_vpos => params['vpos_time'].to_i, :comment => params['comment'])
      redirect_to action: 'index' @msg = "更新しました"
    else redirect_to action: 'index' @msg = "更新に失敗しました"
    end
  end
end
