module SwissVillageDirectory
  class Village
    attr_reader :name, :zip_code, :one_digit_spare, :commune, :canton, :longitude, :latitude

    def initialize(name, zip_code, one_digit_spare, commune, canton, longitude, latitude)
      @name = name
      @zip_code = zip_code.to_i
      @one_digit_spare = one_digit_spare.to_i
      @commune = commune
      @canton = canton
      @longitude = longitude.to_f
      @latitude = latitude.to_f
    end
  end
end
