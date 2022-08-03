class PagesController < ApplicationController
  before_action :authenticate_user!, only: []

  def drinks; end

  def snacks; end

  def promos; end
end
