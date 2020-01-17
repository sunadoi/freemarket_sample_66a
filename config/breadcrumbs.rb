crumb :root do
  link "メルちゃん", root_path
end

crumb :mypage do
  link "マイページ", user_path
end

crumb :profile do
  link "プロフィール", edit_user_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_user_path
  parent :mypage
end

crumb :card do
  link "支払い方法", edit_user_path
  parent :mypage
end

crumb :log_out do
  link "ログアウト", log_out_user_path
  parent :mypage
end

crumb :product do
  link "#{Product.find(params[:id]).name}", product_path
end
