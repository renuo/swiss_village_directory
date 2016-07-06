require 'swiss_village_directory/village'
require 'csv'

module SwissVillageDirectory
  class Repository
    attr_reader :villages

    def initialize
      raw_data = CSV.read('data/PLZO_CSV_WGS84.csv', col_sep: ';')
      @villages = raw_data[1..-1].map do |row|
        Village.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
      end
    end

    def find(find_params = {})
      @villages.find_all { |v| filter_matched?(v, find_params) }
    end

    private

    def filter_matched?(village, filter_params)
      match = true
      filter_params.each do |p|
        begin
          match = false if village.send(p.first) != p.last
        rescue
          match = false
        end
      end
      match
    end
  end
end
