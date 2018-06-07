require 'rails_helper'

RSpec.describe CaseCourtDetail, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(case_id: 1)}
    it { is_expected.to have_index_for(court_detail_id: 1)}
    it { is_expected.to have_index_for(case_id: 1, court_detail_id: 1).with_options(unique: true, background: true)}
  end

  context 'validations' do
     it { is_expected.to validate_presence_of(:case_id) }
     it { is_expected.to validate_presence_of(:court_detail_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:court_detail).as_inverse_of(:case_court_details) }
    it { is_expected.to belong_to(:case).as_inverse_of(:case_court_details) }
  end
end
