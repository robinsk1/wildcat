class MapController < ApplicationController
  def show
    xmin = params[:xmin].to_f
    ymin = params[:ymin].to_f
    xmax = params[:xmax].to_f
    ymax = params[:ymax].to_f

    @areas = WildcatPriorityArea.within(xmin, ymin, xmax, ymax)
    @areas.map { |area| WildcatPriorityAreaResource.new(area).serialize }
  end
end
