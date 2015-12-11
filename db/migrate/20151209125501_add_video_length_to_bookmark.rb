class AddVideoLengthToBookmark < ActiveRecord::Migration
  require 'net/https'
  require 'uri'
  require 'json'

  def change
    add_column :bookmarks, :video_length, :integer, null: false
    Bookmark.reset_column_information
    Bookmark.all.each do |bookmark|
      bookmark.video_length = get_nicovideo_thumb_response(bookmark.smid)[:thumb][:length]
      bookmark.save
    end
  end

  def get_nicovideo_thumb_response(id_info)
    request = "http://ext.nicovideo.jp/api/getthumbinfo/#{id_info}"

    uri = URI.parse(request)
    xml = Net::HTTP.get(uri)
    json = Hash.from_xml(xml).to_json
    nico_thumb_info = JSON.parse(json, {:symbolize_names => true })

    return nico_thumb_info[:nicovideo_thumb_response]
  end

end
