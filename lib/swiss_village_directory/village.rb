module SwissVillageDirectory
  class Village
    attr_reader :name, :zip_code, :commune, :canton, :latitude, :longitude

    def initialize(name, zip_code, commune, canton, latitude, longitude)
      @name = name
      @zip_code = zip_code
      @one_digit_spare = one_digit_spare.to_i
      @commune = commune
      @canton = canton
      @latitude = latitude
      @longitude = longitude
    end
  end
end
