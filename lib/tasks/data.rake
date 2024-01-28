require 'csv'

namespace :data do
  desc "import dumped wildcat priority area table dump"
  task wildcat_priority_area_import: :environment do
    CSV.foreach('./data/wildcat_priority_areas.csv', headers: true) do |row|
      WildcatPriorityArea.find_or_create_by!(row.to_hash)
    end
    puts "DONE!"
  end
end
