require 'rails_helper'

RSpec.describe SubCase, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(sub_case_type: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(sub_case_number: 1).with_options(unique: false, background: true) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:case).as_inverse_of(:sub_cases) }
  end
end
