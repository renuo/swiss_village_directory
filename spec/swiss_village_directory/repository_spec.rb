require 'spec_helper'

cached_repository = SwissVillageDirectory::Repository.new

describe SwissVillageDirectory::Repository do
  let(:repo) { cached_repository }

  it 'can be initialized' do
    expect(repo.villages.count).to eq(5736)
  end

  it 'can randomly access a sample' do
    random_village = repo.villages.find { |v| v.name == 'Riedt b. Erlen' }
    expect(random_village).not_to be_nil
  end

  it 'reads the values from an exel and shows the right ones' do
    village = repo.villages.find { |v| v.name == 'Aadorf' && v.canton == 'TG' }
    expect(village.name).to eq('Aadorf')
    expect(village.zip_code).to eq(8355)
    expect(village.one_digit_spare).to eq(0)
    expect(village.commune).to eq('Aadorf')
    expect(village.canton).to eq('TG')
    expect(village.longitude).to eq(8.89769823294554)
    expect(village.latitude).to eq(47.49135943297217)
  end

  describe '#find_all_by' do
    it 'finds by attribute' do
      expect(repo.find_all_by(name: 'Aadorf_wrong').count).to eq(0)
      expect(repo.find_all_by(name: 'Aadorf').count).to eq(2)
      expect(repo.find_all_by(zip_code: 0).count).to eq(0)
      expect(repo.find_all_by(zip_code: 8355).count).to eq(2)
      expect(repo.find_all_by(one_digit_spare: 1000).count).to eq(0)
      expect(repo.find_all_by(one_digit_spare: 0).count).to be > 1
      expect(repo.find_all_by(commune: 'nonexistingAadorf').count).to eq(0)
      expect(repo.find_all_by(commune: 'Aadorf').count).to eq(6)
      expect(repo.find_all_by(canton: 'TG_wrong').count).to eq(0)
      expect(repo.find_all_by(canton: 'TG').count).to be > 1
      expect(repo.find_all_by(longitude: 0).count).to eq(0)
      expect(repo.find_all_by(longitude: 1000).count).to eq(0)
      expect(repo.find_all_by(longitude: 9.595055059743).count).to eq(1)
      expect(repo.find_all_by(latitude: 1000).count).to eq(0)
      expect(repo.find_all_by(latitude: 45.86277462745).count).to eq(1)
    end

    it 'works if a random attribute is returned' do
      expect(repo.find_all_by(random_attribute: 'random').count).to eq(0)
    end

    it 'finds by using multiple attributes' do
      expect(repo.find_all_by(commune: 'Aadorf', canton: 'TG').count).to eq(6)
      expect(repo.find_all_by(commune: 'Aadorf', canton: 'ZG').count).to eq(0)
    end
  end
end
