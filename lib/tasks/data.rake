require 'csv'

namespace :data do
  desc "import dumped wildcat priority area table dump"
  task wildcat_priority_area_import: :environment do
    CSV.foreach('./data/wildcat_priority_areas.csv', headers: true) do |row|
      WildcatPriorityArea.create!(row.to_hash)
    end
  end
end
