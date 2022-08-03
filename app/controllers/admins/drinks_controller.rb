# frozen_string_literal: true

module Admins
  class DrinksController < ApplicationController
    def drinks
      @drinks = Drink.all
    end

    def drink
      @drink = Drink.find(params[:id])
    end

    def new_drink
      @drink = Drink.new
    end

    def create_drink
      @drink = Drink.new(drink_params)

      if @drink.save
        redirect_to drink_admins_path(@drink), notice: 'Drink was successfully created.'
      else
        render :new_drink, status: :unprocessable_entity
      end
    end

    def edit_drink
      @drink = Drink.find(params[:id])
    end

    def update_drink
      @drink = Drink.find(params[:id])

      if @drink.update(drink_params)
        redirect_to drink_admins_path(@drink), notice: 'Drink was successfully updated.'
      else
        render :edit_drink
      end
    end

    def delete_drink
      @drink = Drink.find(params[:id])

      if @drink.destroy
        redirect_to drinks_admins_path, notice: 'The drink was successfully removed.'
      else
        redirect_to drinks_admins_path, alert: 'Cannot remove the drink.'
      end
    end

    private

    def drink_params
      params.require(:drink).permit(:name, :description, :ingredients, :price)
    end
  end
end
