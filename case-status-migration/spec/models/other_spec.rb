require 'rails_helper'

RSpec.describe Other, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'validations' do
    it { is_expected.to validate_uniqueness_of(:uri) }
  end

  context 'associations' do
    it { is_expected.to have_many(:cases).as_inverse_of(:other).with_autosave }
    it { is_expected.to have_many(:extra_params,).as_inverse_of(:other).with_dependent(:destroy).with_autosave }
  end

end
