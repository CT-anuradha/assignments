require 'rails_helper'

RSpec.describe City, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(name: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(name: 1, location_id: 1).with_options(unique: true, background: false) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:location_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:location).as_inverse_of(:cities) }
  end

end
