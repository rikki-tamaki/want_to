# MyPageController
class MyPageController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def update
    bookmark = Bookmark.where(user_id: current_user.id, id: params[:id]).first
    if bookmark.video_length < params[:start_vpos].to_i then
      flash[:notice] = "動画の再生時間より長い時間が指定されています"
    elsif params[:start_vpos].to_i < 0 then
      flash[:notice] = "マイナスの時間が指定されています"
    else 
      bookmark.start_vpos = params[:start_vpos]
    end
    bookmark.comment = params[:comment]
    bookmark.save

    flash[:notice] = 'ふせんの更新に成功しました。'
    redirect_to action: 'index'
  end

  def delete
    bookmark = Bookmark.where(user_id: current_user.id, id: params[:id]).first
    begin
      bookmark.destroy
      flash[:notice] = 'ふせんを削除しました。'
    rescue => e
      flash[:notice] = 'ふせんの削除に失敗しました。'
      logger.warn e
    end
    redirect_to action: 'index'
  end
end
