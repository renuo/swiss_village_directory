require 'spec_helper'

describe SwissVillageDirectory::Village do
  subject { described_class.new('Ortsname', '1337', '0', 'Gemeinde', 'Kanton', '8', '47') }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:zip_code) }
  it { is_expected.to respond_to(:one_digit_spare) }
  it { is_expected.to respond_to(:commune) }
  it { is_expected.to respond_to(:canton) }
  it { is_expected.to respond_to(:latitude) }
  it { is_expected.to respond_to(:longitude) }

  it 'has the correct value types' do
    expect(subject.name).to be_a String
    expect(subject.zip_code).to be_a String
    expect(subject.one_digit_spare).to be_a Numeric
    expect(subject.latitude).to be_a Numeric
    expect(subject.longitude).to be_a Numeric
  end
end
