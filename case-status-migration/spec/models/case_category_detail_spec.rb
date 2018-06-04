require 'rails_helper'

RSpec.describe CaseCategoryDetail, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'associations' do
    it { is_expected.to belong_to(:case).as_inverse_of(:case_category_details) }
    it { is_expected.to belong_to(:category_detail).as_inverse_of(:case_category_details) }
  end
end
