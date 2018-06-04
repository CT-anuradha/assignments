require 'rails_helper'

RSpec.describe CourtGroup, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'validations' do
    it { is_expected.to validate_presence_of(:court_name) }
    it { is_expected.to validate_presence_of(:court_type) }
  end

  context 'associations' do
    it { is_expected.to have_many(:cases).as_inverse_of(:court_group) }
    it { is_expected.to belong_to(:location).as_inverse_of(:court_groups) }
  end
end
