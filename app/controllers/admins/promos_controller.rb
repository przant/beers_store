# frozen_string_literal

module Admins
  class PromosController < ApplicationController
    def promos
      @promos = Promo.all
    end

    def promo
      @promo = Promo.find(params[:id])
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

    def delete_promo
      @promo = Promo.find(params[:id])

      if @promo.destroy
        redirect_to promos_admins_path, notice: 'The promo was successfully removed'
      else
        redirect_to promos_admins_path, alert: 'Cannot remove the promo'
      end
    end

    private

    def promo_params
      params.require(:promo).permit(:name, :description, :price, :active)
    end
  end
end
