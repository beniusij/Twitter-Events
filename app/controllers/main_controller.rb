class MainController < ApplicationController
  def home
  end

  def search
    @events = Event.search(params[:search])
  end
end
