require 'spec_helper'

describe SwissVillageDirectory::Village do
  subject { described_class.new('Ortsname', 1337, 'Gemeinde', 'Kanton', 8, 47) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:zip_code) }
  it { is_expected.to respond_to(:commune) }
  it { is_expected.to respond_to(:canton) }
  it { is_expected.to respond_to(:latitude) }
  it { is_expected.to respond_to(:longitude) }
end
