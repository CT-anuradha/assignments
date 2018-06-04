require 'rails_helper'

RSpec.describe CaseSubCase, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'associations' do
    it { is_expected.to belong_to(:sub_case).as_inverse_of(:case_sub_cases) }
    it { is_expected.to belong_to(:case).as_inverse_of(:case_sub_cases) }
  end
end
