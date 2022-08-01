class AdminsController < ApplicationController
  def dashboard
  end

  def new_drink
    @drink = Drink.new
  end

  def create_drink
    @drink = Drink.new(drink_params)

    if @drink.save
      redirect_to dashboard_admins_path, notice: 'Drink was successfully created.'
    else
      render :new_drink, status: :unprocessable_entity
    end
  end

  def new_snack
    @snack = Snack.new
  end

  def create_snack
    @snack = Snack.new(snack_params)

    if @snack.save
      redirect_to dashboard_admins_path, notice: 'Snack was successfully created.'
    else
      render :new_snack, status: :unprocessable_entity
    end
  end

  def new_promo
    @promo = Promo.new
  end

  def create_promo
    @promo = Promo.new(promo_params)

    if @promo.save
      redirect_to dashboard_admins_path, notice: 'Promo was successfully created.'
    else
      render :new_promo, status: :unprocessable_entity
    end
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :description, :ingredients, :price)
  end

  def snack_params
    params.require(:snack).permit(:name, :description, :ingredients, :price)
  end

  def promo_params
    params.require(:promo).permit(:name, :description, :price, :active)
  end
end
