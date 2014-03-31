class EarthquakesController < ApplicationController
  layout 'superhero'
  require 'rest_client'
  require 'open-uri'
  
  # GET /earthquakes
  # GET /earthquakes.json
  def index
    # http://comcat.cr.usgs.gov/fdsnws/event/1/query?starttime=2014-03-23%2000:00:00&minmagnitude=2&format=geojson&endtime=2014-03-30%2023:59:59&orderby=time
    starttime = '2014-03-30%2000:00:00'
    endtime = '2014-03-30%2023:59:59'
    minmag = '2'
    url  = @baseurl + "starttime="+ starttime +"&minmagnitude=" + minmag + "&endtime=" + endtime
    search_url = URI::encode(url)
    logger.info "#{url}"
    @earthquakes = RestClient.get url, :accept => :json
 #  @earthquakes = JSON.parse(@earthquakes, {:symbolize_names => true})
 #  
 #  @geojson = Array.new
 #  
 #  @earthquakes[:features].each do |earthquake|
 #    @geojson <<{
 #      type: 'Feature',
 #      geometry: {
 #        type: 'Point',
 #        coordinates: earthquake[:geometry][:coordinates]
 #      },
 #      properties: {
 #        place: earthquake[:properties][:place],
 #        time: earthquake[:properties][:time],
 #        mag: earthquake[:properties][:mag]
 #      }
 #    }
 #  end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @earthquakes }
    end
  end
  
  # GET /earthquakes/search
  # GET /earthquakes/search.json
  def search
    @starttime = params[:start]
    @endtime = params[:end]
    @minmag = params[:mag]
    url  = @baseurl + "starttime="+ @starttime +"&minmagnitude=" + @minmag + "&endtime=" + @endtime
    search_url = URI::encode(url)
    logger.info "----------------#{search_url}"
    @result = RestClient.get search_url, :accept => :json
    
    respond_to  do |format|
      format.html
      format.json { render json: @result }
      format.js
    end    
  end
  

  # GET /earthquakes/1
  # GET /earthquakes/1.json
  def show
    @earthquake = Earthquake.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @earthquake }
    end
  end

  # GET /earthquakes/new
  # GET /earthquakes/new.json
  def new
    @earthquake = Earthquake.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @earthquake }
    end
  end

  # GET /earthquakes/1/edit
  def edit
    @earthquake = Earthquake.find(params[:id])
  end

  # POST /earthquakes
  # POST /earthquakes.json
  def create
    @earthquake = Earthquake.new(params[:earthquake])

    respond_to do |format|
      if @earthquake.save
        format.html { redirect_to @earthquake, notice: 'Earthquake was successfully created.' }
        format.json { render json: @earthquake, status: :created, location: @earthquake }
      else
        format.html { render action: "new" }
        format.json { render json: @earthquake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /earthquakes/1
  # PUT /earthquakes/1.json
  def update
    @earthquake = Earthquake.find(params[:id])

    respond_to do |format|
      if @earthquake.update_attributes(params[:earthquake])
        format.html { redirect_to @earthquake, notice: 'Earthquake was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @earthquake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /earthquakes/1
  # DELETE /earthquakes/1.json
  def destroy
    @earthquake = Earthquake.find(params[:id])
    @earthquake.destroy

    respond_to do |format|
      format.html { redirect_to earthquakes_url }
      format.json { head :no_content }
    end
  end
end
