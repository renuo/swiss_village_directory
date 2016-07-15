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

    def find_all_by(find_params)
      @villages.find_all { |v| all_filters_matched?(v, find_params) }
    end

    private

    def all_filters_matched?(village, filter_params)
      filter_params.each do |p|
        return false if filter_matches?(village, p.first, p.last)
      end
    end

    def filter_matches?(village, key, value)
      village.instance_variable_get("@#{key}") != value
    end
  end
end
