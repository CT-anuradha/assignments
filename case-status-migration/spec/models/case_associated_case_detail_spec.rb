require 'rails_helper'

RSpec.describe CaseAssociatedCaseDetail, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'associations' do
    it { is_expected.to belong_to(:associated_case_detail).as_inverse_of(:case_associated_case_details) }
    it { is_expected.to belong_to(:case).as_inverse_of(:case_associated_case_details) }
  end
end
