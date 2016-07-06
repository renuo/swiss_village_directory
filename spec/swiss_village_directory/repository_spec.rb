require 'spec_helper'

describe SwissVillageDirectory::Repository do
  let(:repo) { described_class.new }

  it 'can be initialized' do
    expect(repo.villages.count).to eq(4168)
  end

  it 'can randomly access a sample' do
    random_village = repo.villages.find { |v| v.name == 'Riedt b. Erlen' }
    expect(random_village).not_to be_nil
  end

  it 'reads the values from an exel and shows the right ones' do
    fake_csv = [['first_ignored_row_with_headers'],
                ['Aadorf', '8355', '0', 'Aadorf', 'TG', '8.906', '47.496']]
    expect_any_instance_of(CSV).to receive(:read).and_return(fake_csv)
    expect(repo.villages.count).to eq(1)
    village = repo.villages.find { |v| v.name == 'Aadorf' }
    expect(village.name).to eq('Aadorf')
    expect(village.zip_code).to eq(8355)
    expect(village.one_digit_spare).to eq(0)
    expect(village.commune).to eq('Aadorf')
    expect(village.canton).to eq('TG')
    expect(village.longitude).to eq(8.906)
    expect(village.latitude).to eq(47.496)
  end

  describe '#find' do
    before do
      fake_csv = [['first_ignored_row_with_headers'],
                  ['Aadorf', '8355', '0', 'AadorfCommune', 'TG', '8.906', '47.496'],
                  ['Bbdorf', '8354', '0', 'AadorfCommune', 'AG', '9.906', '48.496']]
      expect_any_instance_of(CSV).to receive(:read).and_return(fake_csv)
    end

    it 'finds by attribute' do
      expect(repo.find(name: 'Aadorf_wrong').count).to eq(0)
      expect(repo.find(name: 'Aadorf').count).to eq(1)
      expect(repo.find(zip_code: 0).count).to eq(0)
      expect(repo.find(zip_code: 8355).count).to eq(1)
      expect(repo.find(one_digit_spare: 1).count).to eq(0)
      expect(repo.find(one_digit_spare: 0).count).to eq(2)
      expect(repo.find(commune: 'AadorfCommune_wrong').count).to eq(0)
      expect(repo.find(commune: 'AadorfCommune').count).to eq(2)
      expect(repo.find(canton: 'TG_wrong').count).to eq(0)
      expect(repo.find(canton: 'TG').count).to eq(1)
      expect(repo.find(longitude: 0).count).to eq(0)
      expect(repo.find(longitude: 8.089).count).to eq(0)
      expect(repo.find(longitude: 8.906).count).to eq(1)
      expect(repo.find(latitude: 47.099).count).to eq(0)
      expect(repo.find(latitude: 47.496).count).to eq(1)
    end

    it 'works if a random attribute is returned' do
      expect(repo.find(random_attribute: 'random').count).to eq(0)
    end

    it 'finds by using multiple attributes' do
      expect(repo.find(commune: 'AadorfCommune', canton: 'TG').count).to eq(1)
      expect(repo.find(commune: 'AadorfCommune', canton: 'ZG').count).to eq(0)
    end
  end
end
