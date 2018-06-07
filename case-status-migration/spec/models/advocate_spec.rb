require 'rails_helper'

RSpec.describe Advocate, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(name: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(name: 1, code: 1).with_options(unique: true, background: true) }
  end

  context 'validations' do
    it {is_expected.to validate_uniqueness_of(:name).case_insensitive.scoped_to(:code) }
  end

  context 'associations' do
    it { is_expected.to have_many(:usr_details).as_inverse_of(:advocate).with_autosave }
    it { is_expected.to have_many(:advocate_parties).as_inverse_of(:advocate).with_autosave }
    it { is_expected.to have_many(:case_advocates).as_inverse_of(:advocate).with_autosave }
  end

end
