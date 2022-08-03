class PagesController < ApplicationController
  before_action :authenticate_user!, only: []

  def drinks; end

  def snacks; end

  def promos
    @promos = Promo.where(active: true)
  end
end
