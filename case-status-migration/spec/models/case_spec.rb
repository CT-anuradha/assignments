require 'rails_helper'

RSpec.describe Case, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  it { should enumerize(:flag).in(:meta_data, :updated, :crawl, :parse, :not_available_on_website) }

  context 'index' do
    it { is_expected.to have_index_for(court_group_id: 1)}
    it { is_expected.to have_index_for(case_act_id: 1)}
    it { is_expected.to have_index_for(casestatus_param_id: 1)}
    it { is_expected.to have_index_for(next_hearing: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(case_stage: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(side: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(case_type: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(case_number: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(flag: 1).with_options(unique: false, background: true) }
    it { is_expected.to have_index_for(csp: 1).with_options(unique: true, background: false) }
    it { is_expected.to have_index_for(case_type: 1, case_number: 1, court_group_id: 1, csp: 1).with_options(unique: true,  background: false) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:case_number) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_presence_of(:flag) }
    it { is_expected.to validate_presence_of(:case_type) }
    it {is_expected.to validate_uniqueness_of(:case_type) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:court_group).as_inverse_of(:cases) }
    it { is_expected.to belong_to(:fir_detail).as_inverse_of(:cases) }
    it { is_expected.to belong_to(:judge).as_inverse_of(:cases) }
    it { is_expected.to belong_to(:other).as_inverse_of(:cases) }
    it { is_expected.to have_one(:vehicle).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_one(:case_information).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_one(:filing_detail).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_one(:casestatus_param).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:case_sub_cases).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:ia_details).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:case_departments).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:case_details).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:case_category_details).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:histories).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:case_interlocutory_applications).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:case_associated_case_details).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:case_court_details).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:lower_court_details).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:orders).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:papers).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:case_hearings).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:usr_details).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:vakalats).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:case_parties).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
    it { is_expected.to have_many(:case_acts).as_inverse_of(:case).with_dependent(:destroy).with_autosave }
  end
end
