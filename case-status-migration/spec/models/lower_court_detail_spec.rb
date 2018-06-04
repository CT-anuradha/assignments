require 'rails_helper'

RSpec.describe LowerCourtDetail, type: :model do

  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(case_number: 1).with_options(unique: false, background: true) }
  end

  context 'validations' do
    it {is_expected.to validate_uniqueness_of(:place) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:case).as_inverse_of(:lower_court_details) }
  end

end
