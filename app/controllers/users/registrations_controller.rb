# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    @user.birthday = birthday_params
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_user_data"] = {user: @user.attributes}
    session["devise.regist_user_data"][:user]["password"] = params[:user][:password]
    render :tel
  end

  def tel
    @user = User.new(session["devise.regist_user_data"]["user"])
    @address = @user.build_address
    render :address
  end

  def address
    @user = User.new(session["devise.regist_user_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :address and return
    end
    session["devise.regist_address_data"] = {address: @address.attributes}
    @card = @user.build_card
    render :card
  end

  def card
    @user = User.new(session["devise.regist_user_data"]["user"])
    @address = Address.new(session["devise.regist_address_data"]["address"])
    @card = Card.new(card_params)
    unless @card.valid?
      flash.now[:alert] = @card.errors.full_messages
      render :card and return
    end
    @user.build_address(@address.attributes)
    @user.build_card(@card.attributes)
    @user.save
    render :complete
  end


  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def birthday_params
    date = params[:birthday]
    # ブランク時のエラー回避のため、ブランクだったら何もしない
    if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
      return
    end
    # 年月日別々できたものを結合して新しいDate型変数を作って返す
    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  end

  def address_params
    params.required(:address).permit(:postal_code, :city, :street, :building).merge(prefecture: params[:address][:prefecture].to_i)
  end

  def card_params
    params.require(:card).permit(:number, :expiration, :security_code)
  end
end
