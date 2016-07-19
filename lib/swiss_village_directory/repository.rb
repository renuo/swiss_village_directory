require 'swiss_village_directory/village'
require 'csv'

module SwissVillageDirectory
  class Repository
    attr_reader :villages

    def initialize
      raw_data = CSV.read(File.dirname(__FILE__) + '/../../data/PLZO_CSV_WGS84.csv', col_sep: ';')
      @villages = raw_data[1..-1].map do |row|
        Village.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
      end
    end
  end
end
