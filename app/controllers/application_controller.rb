class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter  :set_baseurl
  helper :application

  def set_baseurl
    @baseurl = "http://comcat.cr.usgs.gov/fdsnws/event/1/query?format=geojson&orderby=time&maxlatitude=70&minlatitude=5&maxlongitude=-70&minlongitude=-161&minmagnitude=3&"
  end
  
  # http://comcat.cr.usgs.gov/fdsnws/event/1/query?starttime=2014-03-24%2000:00:00&maxlatitude=70&minlatitude=5&maxlongitude=-70&minlongitude=-161&minmagnitude=3&format=geojson&endtime=2014-03-31%2023:59:59&orderby=time
  
end
