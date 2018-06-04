require 'rails_helper'

RSpec.describe CasestatusParam, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(case_year: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(case_type: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(case_number: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(main_case: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(source: 1).with_options(unique: false, background: true) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:case_number) }
    it { is_expected.to validate_presence_of(:case_type) }
    it { is_expected.to validate_presence_of(:case_year) }
    it { is_expected.to validate_presence_of(:main_case) }
    it { is_expected.to validate_presence_of(:source) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:case).as_inverse_of(:casestatus_param) }
  end

end
