class WildcatPriorityAreasController < ApplicationController
  before_action :set_wildcat_priority_area, only: :show

  def show
  end

  def contains
    split = params[:coord].split(' ')

    lat = split[0].to_f
    lon = split[1].to_f

    areas = WildcatPriorityArea.contains(lon, lat)

    render(json: json_for(areas))
  end

  private

  def json_for(areas)
    areas.map { |area| WildcatPriorityAreaResource.new(area).serialize }
  end

  def set_wildcat_priority_area
    @wildcat_priority_area = WildcatPriorityArea.find(params[:id])
  end
end
