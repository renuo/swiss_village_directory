require 'spec_helper'

describe SwissVillageDirectory do
  it 'has a version number' do
    expect(SwissVillageDirectory::VERSION).not_to be nil
  end

  it 'makes exactly one repository instance accessible' do
    expect(SwissVillageDirectory.repository).to be_a(SwissVillageDirectory::Repository)
    expect(SwissVillageDirectory.repository).to be(SwissVillageDirectory.repository)
  end

  it 'makes villages directly accessible through a facade' do
    expect(SwissVillageDirectory.villages).to be_an(Enumerable)
  end

  describe '.grouped_villages' do
    it 'returns the villages grouped by zip code' do
      villages8057 = SwissVillageDirectory.grouped_villages['8057']
      expect(villages8057).to be_an(Enumerable)
      expect(villages8057.length).to eq(1)
      expect(villages8057[0]).to be_a(SwissVillageDirectory::Village)
    end
  end
end
