class WildcatPriorityAreasController < ApplicationController
  before_action :set_wildcat_priority_area, only: :show

  def show
  end

  def contains
    split = params[:coord].split(' ')
    lat = split[0].to_f
    lon = split[1].to_f

    areas = WildcatPriorityArea.contains(lon, lat)

    render json: json_for(areas)
  end

  def within
    xmin = params[:xmin].to_f
    ymin = params[:ymin].to_f
    xmax = params[:xmax].to_f
    ymax = params[:ymax].to_f

    areas = WildcatPriorityArea.within(xmin, ymin, xmax, ymax)

    render json: json_for(areas)
  end

  private

  def json_for(areas)
    areas.each_with_object([]) do |area, array|
      geoJson = {}
      geoJson[:type] = 'Feature'
      geoJson[:geometry] = RGeo::GeoJSON.encode(area.wkb_geometry)
      geoJson[:properties] = { status: area.status,
                               location: area.location,
                               shape_length: area.shape_length,
                               shape_area: area.shape_area}
      array << geoJson
    end
  end

  def set_wildcat_priority_area
    @wildcat_priority_area = WildcatPriorityArea.find(params[:id])
  end
end
