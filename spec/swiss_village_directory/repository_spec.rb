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
end
