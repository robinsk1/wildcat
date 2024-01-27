class WildcatPriorityAreasController < ApplicationController
  before_action :set_wildcat_priority_area, only: %i[ show edit update destroy ]

  # GET /wildcat_priority_areas
  def index
    @wildcat_priority_areas = WildcatPriorityArea.all
  end

  # GET /wildcat_priority_areas/1
  def show
  end

  def contains
  end

  def within
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wildcat_priority_area
      @wildcat_priority_area = WildcatPriorityArea.find(params[:id])
    end
end
