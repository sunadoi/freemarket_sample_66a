module ApplicationHelper
  def current_user?
    if current_user.id = @product.user_id
      return true
    end
  end
  def price_split(price)
    price = "¥#{price.to_s(:delimited, delimiter: ',')}"
  end
end
