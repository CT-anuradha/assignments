require 'rails_helper'

RSpec.describe ExtraParam, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  context 'validations' do
    it { is_expected.to validate_presence_of(:m_fil_no) }
    it { is_expected.to validate_presence_of(:m_reg_no) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:other).as_inverse_of(:extra_params) }
  end

end
