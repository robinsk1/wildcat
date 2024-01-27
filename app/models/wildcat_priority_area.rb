class WildcatPriorityArea < ApplicationRecord
  def self.contains(lon, lat)
    point = RGeo::Geos.factory(srid: 4326).point(lon, lat)

    areas = WildcatPriorityArea.arel_table
    
    WildcatPriorityArea.where(areas[:wkb_geometry].st_contains(point))
  end

  def self.within(xmin, ymin, xmax, ymax)
    se = RGeo::Geos.factory(srid: 4326).point(xmin, ymin)
    nw = RGeo::Geos.factory(srid: 4326).point(xmax, ymax)
    box = RGeo::Cartesian::BoundingBox.create_from_points(se, nw)
    areas = WildcatPriorityArea.arel_table
    WildcatPriorityArea.where(areas[:wkb_geometry].st_within(box))
  end
end
