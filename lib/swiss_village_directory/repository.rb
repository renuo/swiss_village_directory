require 'csv'

module SwissVillageDirectory
  class Repository
    attr_reader :villages

    def initialize
      raw_data = CSV.read('data/PLZO_CSV_WGS84.csv', col_sep: ';')
      @villages = raw_data[1..-1].map do |row|
        Village.new(row[0], row[1], row[2], row[3], row[4], row[5])
      end
    end
  end
end
