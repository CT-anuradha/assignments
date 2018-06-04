require 'rails_helper'

RSpec.describe FirDetail, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(district: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(place: 1).with_options(unique: false, background: true) }
  end

  context 'associations' do
    it { is_expected.to have_many(:cases).as_inverse_of(:fir_detail).with_autosave }
  end
end
