require 'rails_helper'

RSpec.describe CaseAct, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(act_id: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(case_id: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(act_id: 1, case_id: 1).with_options(unique: true, background: true) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:act_id) }
    it { is_expected.to validate_presence_of(:case_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:act).as_inverse_of(:case_acts) }
    it { is_expected.to belong_to(:case).as_inverse_of(:case_acts) }
  end
end
