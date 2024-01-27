class WildcatPriorityAreaResource
  include Alba::Resource

  attribute :type do
    'Feature'
  end

  attribute :geometry do |resource|
    RGeo::GeoJSON.encode(resource.wkb_geometry)
  end

  attribute :properties do |resource|
    {
      location: resource.location,
      status: resource.status,
      shape_length: resource.shape_length,
      shape_area: resource.shape_area
    }
  end
end
