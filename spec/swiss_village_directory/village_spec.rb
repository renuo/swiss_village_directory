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

  it 'has a numeric values' do
    expect_is_numeric(subject.zip_code)
    expect_is_numeric(subject.one_digit_spare)
    expect_is_numeric(subject.latitude)
    expect_is_numeric(subject.longitude)
  end

  def expect_is_numeric(value)
    expect(value).to be_a Numeric
  end
end
