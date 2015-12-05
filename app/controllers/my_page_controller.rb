class MyPageController < ApplicationController

  before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def update
    @bookmarks = Bookmark.where(user_id: current_user.id)
    bookmark = Bookmark.find(current_user.id)
    if bookmark.update(:start_vpos => params['vpos_time'].to_i, :comment => params['comment'])
      redirect_to action: 'index'
    else redirect_to action: 'index'
    end
  end

  def create(bookmark)
    
  end

  def new
    @bookmark = Bookmark.new
  end
end
