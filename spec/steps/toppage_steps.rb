# coding: utf-8
require 'rails_helper'
steps_for :toppage do
  step '動画検索画面が表示されていること' do
    expect(current_path).to satisfy { |p| ['/home/index'].include?(p) }
  end

  step ':name に :word と入力する' do |name, word|
    fill_in name, with: word
  end

  step ':name ボタンをクリックする' do |name|
    click_on name
  end

  step ':movie_id の再生画面が表示されていること' do |movie_id|
    expect(current_path).to eq "/home/movie/#{movie_id}"
  end

  step 'メッセージ :message が表示されていること' do |message|
    expect(page).to have_content message
  end

  step ':name の値が :value であること' do |name, value|
    expect(page.find(name).value).to eq value
  end

  step '遠隔技術動画が表示されていること' do
    expect(current_path).to satisfy { |p| ['/home/movie/sm20652382', '/home/movie/sm20628576'].include?(p) }
  end
  
  step 'サインアップする' do
   user = User.new(
	   :email => "hogehuga@test.com",
	   :password => "hogehuga1234",
	   :password_confirmation => "hogehuga1234")

   visit '/users/sign_up'
	 
   fill_in 'user[email]',    with: user.email
   fill_in 'user[password]', with: user.password
   fill_in 'user[password_confirmation]', with: user.password_confirmation

   click_button 'アカウント登録'
  end

  step ':file_name にスクリーンショットをとる' do |file_name|
    page.save_screenshot(file_name, full: true)
  end
end
