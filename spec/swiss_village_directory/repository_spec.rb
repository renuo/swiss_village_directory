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
    fake_csv = [["Ortschaftsname", "PLZ", "Zusatzziffer", "Gemeindename", "Kantonskürzel", "E", "N"],
                  ["Aadorf", "8355", "0", "Aadorf", "TG", "8.906", "47.496"]]
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
end
