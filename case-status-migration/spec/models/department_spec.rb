require 'rails_helper'

RSpec.describe Department, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'associations' do
    it { is_expected.to have_many(:case_departments).as_inverse_of(:department).with_autosave }
  end
end
