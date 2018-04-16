class MainController < ApplicationController
  def home
    @city = Geokit::Geocoders::MultiGeocoder.geocode(remote_ip).city
    @local_events = Event.local_events(@city).paginate(page: params[:page], per_page: 10)
    @other_events = Event.other_events(@city).paginate(page: params[:page], per_page: 10)
  end

  def search
    @results = Event.search(params).paginate(page: params[:page], per_page: 10)
    puts @results
  end

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      '158.255.231.106'
    else
      request.remote_ip
    end
  end

  private
  def search_params
    params.require(:event).permit(:keywords, :date)
  end
end
