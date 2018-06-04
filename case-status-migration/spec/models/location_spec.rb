require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'validations' do
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:district) }
  end

  context 'associations' do
    it { is_expected.to have_many(:cities).as_inverse_of(:location).with_dependent(:destroy).with_autosave  }
    it { is_expected.to have_many(:court_groups).as_inverse_of(:location).with_autosave }
  end

end
