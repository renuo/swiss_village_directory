require 'bigdecimal/util'

module SwissVillageDirectory
  class Village
    attr_reader :name, :zip_code, :one_digit_spare, :commune, :canton, :longitude, :latitude

    def initialize(name, zip_code, one_digit_spare, commune, canton, longitude, latitude)
      @name = name
      @zip_code = zip_code.to_s
      @one_digit_spare = one_digit_spare.to_i
      @commune = commune
      @canton = canton
      @longitude = longitude.to_d
      @latitude = latitude.to_d
    end
  end
end
