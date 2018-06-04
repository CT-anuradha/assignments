require 'rails_helper'

RSpec.describe Act, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

   context 'index' do
     it { is_expected.to have_index_for(act: 1).with_options(unique: false, background: true) }
     it { is_expected.to have_index_for(section: 1).with_options(unique: false, background: true) }
   end

  context 'validations' do
    it { is_expected.to validate_uniqueness_of(:act) }
    it { is_expected.to validate_uniqueness_of(:section) }
  end

  context 'associations' do
    it { is_expected.to have_many(:case_acts).as_inverse_of(:act).with_dependent(:destroy).with_autosave }
  end
end
