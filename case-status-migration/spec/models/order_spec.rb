require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  it { should enumerize(:order_type).in(:daily, :final, :regular) }

  context 'associations' do
    it { is_expected.to belong_to(:case).as_inverse_of(:orders) }
  end

end
