require 'rails_helper'

RSpec.describe CourtDetail, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(case_number: 1).with_options(unique: false, background: true)}
  end

  context 'associations' do
    it { is_expected.to have_many(:case_court_details).as_inverse_of(:court_detail).with_autosave }
  end
end
