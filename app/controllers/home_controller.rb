class HomeController < ApplicationController
  before_action :authenticate_user!, only: []
  
  def landing
  end
end
