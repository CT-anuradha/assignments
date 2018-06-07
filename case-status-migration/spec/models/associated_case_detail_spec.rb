require 'rails_helper'

RSpec.describe AssociatedCaseDetail, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  it { should enumerize(:associated_case_type).in(:main_matter, :connected_case) }

  context 'index' do
    it { is_expected.to have_index_for(case_number: 1).with_options(unique: false, background: true) }
  end

  context 'validations' do
     it { is_expected.to validate_presence_of(:case_number) }
     it { is_expected.to validate_presence_of(:associated_case_type) }
  end

  context 'associations' do
    it { is_expected.to have_many(:case_associated_case_details).as_inverse_of(:associated_case_detail).with_autosave }
  end
end
