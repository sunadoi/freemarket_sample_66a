crumb :root do
  link "メルちゃん", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
end

crumb :profile do
  link "プロフィール", edit_user_path(current_user.id)
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_user_path(current_user.id)
  parent :mypage
end

crumb :card do
  link "支払い方法", card_user_path(current_user.id)
  parent :mypage
end

crumb :new_card do
  link "クレジットカード情報入力", new_card_path
  parent :card
end

crumb :log_out do
  link "ログアウト", log_out_user_path(current_user.id)
  parent :mypage
end

crumb :product do
  link "#{Product.find(params[:id]).name}", product_path
end
