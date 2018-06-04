require 'rails_helper'

RSpec.describe CaseInterlocutoryApplication, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'associations' do
    it { is_expected.to belong_to(:interlocutory_application).as_inverse_of(:case_interlocutory_applications) }
    it { is_expected.to belong_to(:case).as_inverse_of(:case_interlocutory_applications) }
  end
end
