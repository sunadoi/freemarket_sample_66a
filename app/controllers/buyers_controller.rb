class BuyersController < ApplicationController
  require 'payjp'

  def new
    @buyer = Buyer.new
    @product = Product.find(params[:id])
    @address = Address.find_by(user_id: current_user.id)
    card = Card.find_by(user_id: current_user.id)
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:private_key]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def create
    
    card = Card.find_by(user_id: current_user.id)
    @product = Product.find(params[:buyer][:product_id])
    Payjp.api_key = Rails.application.credentials[:payjp][:private_key]
    Payjp::Charge.create(
    amount: @product.price,   #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
    @buyer =Buyer.new(user_id: current_user.id, product_id: params[:buyer][:product_id])
    @buyer.save
    render :done #完了画面に移動
  end

end
