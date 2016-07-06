require 'swiss_village_directory/repository'
require 'swiss_village_directory/version'
require 'swiss_village_directory/village'

module SwissVillageDirectory
  def self.repository
    @repository ||= Repository.new
  end

  def self.villages
    repository.villages
  end
end
