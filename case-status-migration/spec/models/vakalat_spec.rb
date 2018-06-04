require 'rails_helper'

RSpec.describe Vakalat, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(advocate: 1).with_options(unique: false, background: true) }
  end

  context 'validations' do
    it {is_expected.to validate_uniqueness_of(:advocate) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:case).as_inverse_of(:vakalats) }
  end

end
