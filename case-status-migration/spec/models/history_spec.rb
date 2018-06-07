require 'rails_helper'

RSpec.describe History, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(judge_id: 1)}
    it { is_expected.to have_index_for(case_id: 1)}
  end

  context 'associations' do
    it { is_expected.to belong_to(:case).as_inverse_of(:histories) }
    it { is_expected.to belong_to(:judge).as_inverse_of(:histories) }
  end
end
