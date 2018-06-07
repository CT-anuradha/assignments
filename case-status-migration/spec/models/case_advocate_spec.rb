require 'rails_helper'

RSpec.describe CaseAdvocate, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(case_id: 1).with_options(unique: false, background: true)}
    it { is_expected.to have_index_for(advocate_id: 1).with_options(unique: false, background: true)}
    it { is_expected.to have_index_for(case_id: 1, advocate_id: 1).with_options(unique: true, background: true)}
  end

  context 'associations' do
    it { is_expected.to belong_to(:case).as_inverse_of(:case_advocates) }
    it { is_expected.to belong_to(:advocate).as_inverse_of(:case_advocates) }
  end

end
