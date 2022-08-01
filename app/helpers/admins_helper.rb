module AdminsHelper
  def total_users
    User.where(role: [nil, 'Normal']).count
  end

  def total_drinks
    Drink.count
  end
end
