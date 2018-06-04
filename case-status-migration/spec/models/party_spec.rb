require 'rails_helper'

RSpec.describe Party, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(name: 1) }
  end

  context 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context 'associations' do
    it { is_expected.to have_many(:advocate_parties).as_inverse_of(:party).with_autosave }
    it { is_expected.to have_many(:case_parties).as_inverse_of(:party).with_autosave }
  end

end
