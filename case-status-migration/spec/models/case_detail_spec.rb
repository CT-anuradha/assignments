require 'rails_helper'

RSpec.describe CaseDetail, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'index' do
    it { is_expected.to have_index_for(case_number: 1)}
  end

  #context 'validations' do
   # it { is_expected.to validate_presence_of(:case_number) }
 # end

  context 'associations' do
    it { is_expected.to belong_to(:case).as_inverse_of(:case_details) }
  end
end
