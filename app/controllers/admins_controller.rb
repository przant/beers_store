class AdminsController < ApplicationController
  def dashboard
  end

  def snacks
    @snacks = Snack.all
  end

  def promos
    @promos = Promo.all
  end

  def snack
    @snack = Snack.find(params[:id])
  end

  def promo
    @promo = Promo.find(params[:id])
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

  def edit_snack
    @snack = Snack.find(params[:id])
  end

  def update_snack
    @snack = Snack.find(params[:id])

    if @snack.update(snack_params)
      redirect_to snack_admins_path(@snack), notice: 'Snack was successfully updated.'
    else
      render :edit_snack
    end
  end

  def edit_promo
    @promo = Promo.find(params[:id])
  end

  def update_promo
    @promo = Promo.find(params[:id])

    if @promo.update(promo_params)
      redirect_to promo_admins_path(@promo), notice: 'Promo was successfully updated.'
    else
      render :edit_promo
    end
  end

  def delete_snack
    @snack = Snack.find(params[:id])

    if @snack.destroy
      redirect_to snacks_admins_path, notice: 'The snack was successfuly removed.'
    else
      redirect_to snacks_admins_path, alert: 'Cannot remove the snack.'
    end
  end

  def delete_promo
    @promo = Promo.find(params[:id])

    if @promo.destroy
      redirect_to promos_admins_path, notice: 'The promo was successfully removed'
    else
      redirect_to promos_admins_path, alert: 'Cannot remove the promo'
    end
  end

  private

  def snack_params
    params.require(:snack).permit(:name, :description, :ingredients, :price)
  end

  def promo_params
    params.require(:promo).permit(:name, :description, :price, :active)
  end
end
