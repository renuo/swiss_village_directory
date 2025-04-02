require 'bigdecimal/util'

module SwissVillageDirectory
  class Street
    attr_reader :name

    def initialize(name)
      @name = name
    end
  end
end
