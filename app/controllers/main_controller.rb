class MainController < ApplicationController
  def home
    location = "Birmingham"
    @local_events = Event.where("keywords LIKE ?", "%" + location + "%").order(date: :asc)
    @other_events = Event.where("keywords NOT LIKE ?", "%" + location + "%").order(date: :asc)

  end

  def search
    @results = Event.search(params)
  end

  private
  def search_params
    params.require(:event).permit(:keywords, :date)
  end
end
