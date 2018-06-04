require 'rails_helper'

RSpec.describe InterlocutoryApplication, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'associations' do
    it { is_expected.to have_many(:case_interlocutory_applications).as_inverse_of(:interlocutory_application).with_autosave }
  end
end
