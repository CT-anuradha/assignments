require 'rails_helper'

RSpec.describe CaseAssociatedCaseDetail, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(case_id: 1)}
    it { is_expected.to have_index_for(associated_case_detail_id: 1)}
    it { is_expected.to have_index_for(case_id: 1, associated_case_detail_id: 1).with_options(unique: true, background: true)}
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:case_id) }
    it { is_expected.to validate_presence_of(:associated_case_detail_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:associated_case_detail).as_inverse_of(:case_associated_case_details) }
    it { is_expected.to belong_to(:case).as_inverse_of(:case_associated_case_details) }
  end

end
