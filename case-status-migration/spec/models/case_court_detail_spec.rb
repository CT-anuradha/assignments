require 'rails_helper'

RSpec.describe CaseCourtDetail, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'associations' do
    it { is_expected.to belong_to(:court_detail).as_inverse_of(:case_court_details) }
    it { is_expected.to belong_to(:case).as_inverse_of(:case_court_details) }
  end
end
