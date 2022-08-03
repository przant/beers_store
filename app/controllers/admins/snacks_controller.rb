# frozen_string_literal: true

module Admins
  class SnacksController < ApplicationController
    def snacks
      @snacks = Snack.all
    end

    def snack
      @snack = Snack.find(params[:id])
    end

    def new_snack
      @snack = Snack.new
    end

    def create_snack
      @snack = Snack.new(snack_params)

      if @snack.save
        redirect_to snack_admins_path(@snack), notice: 'Snack was successfully created.'
      else
        render :new_snack, status: :unprocessable_entity
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

    def delete_snack
      @snack = Snack.find(params[:id])

      if @snack.destroy
        redirect_to snacks_admins_path, notice: 'The snack was successfully removed.'
      else
        redirect_to snacks_admins_path, alert: 'Cannot remove the snack.'
      end
    end

    private

    def snack_params
      params.require(:snack).permit(:name, :description, :ingredients, :price)
    end
  end
end
