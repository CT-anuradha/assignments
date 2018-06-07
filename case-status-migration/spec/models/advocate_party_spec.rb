require 'rails_helper'

RSpec.describe AdvocateParty, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(advocate_id: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(party_id: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(advocate_id: 1, party_id: 1, category: 1).with_options(unique: true, background: true) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:category) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:advocate).as_inverse_of(:advocate_parties) }
    it { is_expected.to belong_to(:party).as_inverse_of(:advocate_parties) }
  end

end
