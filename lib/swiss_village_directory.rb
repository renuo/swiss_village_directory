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

  def self.grouped_villages
    villages.each_with_object({}) do |v, h|
      (h[v.zip_code] ||= []) << v
    end
  end
end
