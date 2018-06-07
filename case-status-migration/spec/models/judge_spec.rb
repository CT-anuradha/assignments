require 'rails_helper'

RSpec.describe Judge, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(name: 1).with_options(unique: false, background: true)}
  end

  context 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context 'associations' do
    it { is_expected.to have_many(:case_judges).as_inverse_of(:judge).with_autosave }
    it { is_expected.to have_many(:histories).as_inverse_of(:judge).with_autosave }
  end
end
