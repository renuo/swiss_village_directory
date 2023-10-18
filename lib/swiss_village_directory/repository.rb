require 'swiss_village_directory/village'
require 'csv'

module SwissVillageDirectory
  class Repository
    attr_reader :villages

    def initialize
      filename = "#{File.dirname(__FILE__)}/../../data/PLZO_CSV_WGS84.csv"
      options = { col_sep: ';', encoding: 'UTF-8', headers: :first_row }

      source_key_mapping = {
        'Ortschaftsname' => :name,
        'PLZ' => :zip_code,
        'Zusatzziffer' => :one_digit_spare,
        'Gemeindename' => :commune,
        'BFS-Nr' => :bfs_number,
        'Kantonskürzel' => :canton,
        'E' => :longitude,
        'N' => :latitude,
        'Sprache' => :language
      }

      villages_hashes = CSV.open(filename, 'r', **options).map do |row|
        row.to_h.transform_keys { |k| source_key_mapping[k] }
      end

      @villages = villages_hashes.map do |h|
        Village.new(h[:name], h[:zip_code], h[:one_digit_spare], h[:commune], h[:canton], h[:longitude], h[:latitude])
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
