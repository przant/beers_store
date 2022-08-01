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
  end

  def new_promo
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :description, :ingredients, :price)
  end
end
