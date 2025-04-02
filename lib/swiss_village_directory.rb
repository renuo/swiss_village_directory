require 'swiss_village_directory/repository'
require 'swiss_village_directory/version'
require 'swiss_village_directory/village'
require 'swiss_village_directory/street'

module SwissVillageDirectory
  def self.repository
    @repository ||= Repository.new
  end

  def self.villages
    repository.villages
  end

  def self.streets
    repository.streets
  end
end
