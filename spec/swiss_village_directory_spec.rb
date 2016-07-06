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
end
