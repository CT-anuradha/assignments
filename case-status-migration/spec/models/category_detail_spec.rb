require 'rails_helper'

RSpec.describe CategoryDetail, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'associations' do
    it { is_expected.to have_many(:case_category_details).as_inverse_of(:category_detail).with_autosave }
  end
end
