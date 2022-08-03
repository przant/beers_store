class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[promos]

  def drinks; end

  def snacks; end

  def promos
    @promos = Promo.where(active: true)
  end
end
