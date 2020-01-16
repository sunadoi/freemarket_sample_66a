module ApplicationHelper
  def current_user?
    if current_user.id = @product.user_id
      return true
    end
  end
end
