require 'rails_helper'

RSpec.describe History, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(judge: 1).with_options(unique: false, background: true)}
  end
  
  context 'associations' do
    it { is_expected.to belong_to(:case).as_inverse_of(:histories) }
  end
end
