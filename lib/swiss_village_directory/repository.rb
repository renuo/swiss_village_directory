require 'swiss_village_directory/village'
require 'swiss_village_directory/street'
require 'csv'
require 'byebug'

module SwissVillageDirectory
  class Repository
    attr_reader :villages
    attr_reader :streets

    def initialize
      filename = "#{File.dirname(__FILE__)}/../../data/PLZO_CSV_WGS84.csv"
      streets_filename = "#{File.dirname(__FILE__)}/../../data/Post_Adressdaten20250325.csv"
      options = { col_sep: ';', encoding: 'UTF-8', headers: :first_row }
      streets_options = { col_sep: ';', encoding: 'WINDOWS-1252', headers: false }

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

      streets_source_key_mapping = {
        'Strassenname' => :name,
        'PLZ_id' => :zip_code_id
      }

      villages_hashes = CSV.open(filename, 'r', **options).map do |row|
        row.to_h.transform_keys { |k| source_key_mapping[k] }
      end

      street_hashes = []
      CSV.open(streets_filename, 'r', **streets_options).map do |row|
        # if row.first == '01'
        #   streets_source_key_mapping['PLZ'] = row.fifth
        if row.first == '04'
          # streets_source_key_mapping['Strassenname'] = row[6]
          # streets_source_key_mapping['PLZ_id'] = row[2]
          street_hashes << {
            'Strassenname' => row[6],
            'PLZ_id' => row[2]
          }
        elsif row.first == '05'
          break
        end
        # row.to_h
        # row.to_h.transform_keys { |k| streets_source_key_mapping[k] }
      end

      @villages = villages_hashes.map do |h|
        Village.new(h[:name], h[:zip_code], h[:one_digit_spare], h[:commune], h[:canton], h[:longitude], h[:latitude])
      end

      @streets = street_hashes.map do |h|
        Street.new(h['Strassenname'])
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
