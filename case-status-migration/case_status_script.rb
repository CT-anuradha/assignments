class CaseStatusScript

  attr_reader :data, :other, :judge, :fir_detail, :court_grp

  def sanitize(str)
    string = str.try(:downcase).try(:strip) if str.present?
   return string
  end

  def check_presence(key)
        return key.try(:strip) if key.present?
  end

  def create_advocate_party(p,category,kase)
    if p.has_key?(:advocate)
      advocate = Advocate.find_or_create_by!(name: sanitize(p[:advocate]).gsub(/^\s*(\d+\)|\-|\.)\s*|(\.|\-|\,)$/i, '').strip)
      #advocate.save
      create_case_advocate(advocate,kase)
    end

    if p.has_key?(:name)
      party = Party.find_or_initialize_by(name: sanitize(check_presence(p[:name])).gsub(/^\s*(\d+\)|\-|\.)\s*|(\.|\-|\,)$/i, '').strip)
    end
    party.address = p[:address]
    if party.new_record?
      party.save
    end

    if p.has_key?(:advocate)
      advocate_party = advocate.advocate_parties.find_or_create_by!(party_id: party.id, category: category)
      #advocate_party.save
    end

    case_party = party.case_parties.find_or_create_by!(category: category, case_id: kase.id)
    #case_party.save
    return advocate
  end

  def create_case_advocate(adv,kase)
    kase_adv = adv.case_advocates.find_or_create_by!(case_id: kase.id)
    #kase_adv.save
  end

  def create_associated_case(details,kase,source)
      data[source].each do |asso_case_det|
        associated_case_detail = AssociatedCaseDetail.find_or_create_by!(case_number: check_presence(asso_case_det[:case_no]),
                                                                        associated_case_type: details)
        #associated_case_detail.save

        create_case_associated_case_detail(associated_case_detail,kase)
      end
  end

  def create_case_associated_case_detail(associated_case_detail,kase)
    kase_associated_kase_details = kase.case_associated_case_details.find_or_create_by!(associated_case_detail_id: associated_case_detail.id)
  end

  def create_ia_details(source, kase)
    data[source].each do |ia_det|
      ia_details = kase.interlocutory_applications.find_or_create_by!(name: sanitize(ia_det[:name]),
                                                                        ia_number: ((ia_det[:ia_no]) ? check_presence(ia_det[:ia_no]):check_presence(ia_det[:number]) rescue nil),
                                                                        filed_at: (ia_det[:ia_date]) ? ia_det[:ia_date]:ia_det[:filing_date],
                                                                        status: sanitize(ia_det[:status]),
                                                                        miscellaneous_paper_type: ia_det[:miscellaneous_paper_type],
                                                                        old_ia_number: (ia_det[:old_ia_no] rescue nil))

    end
  end

  def create_usr_detail(kase)
    data[:usr_details].each do |ud|
      if ud.has_key?(:advocate_name)
        advocate = Advocate.find_or_create_by!(name: sanitize(ud[:advocate_name].gsub(/^\s*(\d+\)|\-|\.)\s*|(\.|\-|\,)$/i, '').strip))
      end

      create_case_advocate(advocate,kase)

      usr_det = kase.usr_details.find_or_create_by!(usr_number: ud[:number], usr_type: ud[:type],
                                                       filed_at: ud[:filing_date], advocate_id: advocate.id)
    end
  end

  def create_history(source, kase)
    data[source].each do |history_det|

      history_judge = Judge.find_or_create_by!(name: (history_det[:judge]) ? sanitize(history_det[:judge]):sanitize(history_det[:judge_name]))

      history = kase.histories.find_or_create_by!(next_hearing: history_det[:hearing_date],
                                                     register_number: history_det[:register_no],
                                                     last_hearing: history_det[:business_date],
                                                     status: (history_det[:purpose]) ? sanitize(history_det[:purpose]):sanitize(history_det[:status]),
                                                     judge_id: history_judge.id)

    end
  end

  def create_order(source, kase,type)
    data[source].each do |order_det|

      order = kase.orders.find_or_create_by!(judge: (order_det[:judge_name]) ? sanitize(order_det[:judge_name]):sanitize(order_det[:judge]),
                                                ordered_at: (order_det[:judgement_date]) ? order_det[:judgement_date]:order_det[:order_date],
                                                link: (order_det[:url] ? order_det[:url]:order_det[:order_details]),
                                                order_number: (order_det[:number] ? order_det[:number]:order_det[:sr_no]),
                                                order_type: type)
    end
  end

  def create_judges(kase)
    data[:judges].each do |jud|
      judge = Judge.find_or_create_by!(name: sanitize(jud[:name]))
      @judge = judge
      create_case_judge(kase)
      puts sanitize(judge.name)
    end
  end

  def create_case()
    kase = Case.find_or_initialize_by(csp: data[:csp_id])
    kase.case_type = data[:case_type]
    kase.case_number = data[:case_no]
    kase.year = data[:case_year]
    kase.status = sanitize(data[:case_status])
    kase.filing_number = data[:filing_no] rescue nil
    kase.filed_at = data[:filing_date]
    kase.register_number = data[:register_no] rescue nil
    kase.registered_on = data[:register_date]
    kase.cnr = data[:cnr_no]
    kase.first_hearing = data[:first_hearing]
    kase.decision_at = data[:decision_date]
    kase.next_hearing = data[:next_hearing]
    kase.last_hearing = data[:last_hearing]
    kase.presented_on = data[:presentation_date]
    kase.update_at = data[:update_date]
    kase.service_at = data[:service_date]
    kase.notice_issued_at = data[:notice_issue_date]
    kase.disposed_on = data[:disposal_date]
    kase.ordered_at = data[:order_date]
    kase.judgement_at = data[:judgement_date]
    kase.category = sanitize(data[:category])
    kase.side = sanitize(data[:side])
    kase.case_stage = data[:case_stage]
    case data[:update_flag]
    when 0
      kase.flag = "meta_data"
    when 1
      kase.flag = "updated"
    when -1
      kase.flag = "crawl"
    when -2
      kase.flag = "parse"
    when -3
      kase.flag = "not_available_on_website"
    end
    kase.court_group_id = court_grp.id rescue nil
    kase.fir_detail_id = fir_detail.id rescue nil
    kase.other_id = other.id

    if kase.new_record?
      kase.save
    end

    return kase
  end

  def create_case_judge(kase)
     case_judge = kase.case_judges.find_or_create_by!(judge_id: judge.id)
  end

  def create_case_act(act,kase)
    case_act = act.case_acts.find_or_create_by!(case_id: kase.id)
  end

  def create_case_detail(source, kase)
    data[source].each do |case_det|
      if (case_det[:register_date] || case_det[:filling_no] || case_det[:filing_date] || case_det[:reg_no] || case_det[:court_fees])
        #if (case_det[:main_case] && (case_det[:main_case].strip.length) > 0)

     case_detail = kase.case_details.find_or_create_by!(case_number: case_det[:case_no] ? check_presence(case_det[:case_no]) : check_presence(case_det[:main_case]),
                                                        registered_on: case_det[:register_date],
                                                        register_number: check_presence(case_det[:reg_no]),
                                                        filing_number: check_presence(case_det[:filling_no]),
                                                        filed_at: case_det[:filing_date],
                                                        court_fees: case_det[:court_fees])
      end
    end
  end

  def create_vehicle(source, kase)
     data[source].each do |vehicle_det|
       vehikle = Vehicle.find_or_create_by!(case_id: kase.id,
                                               vehicle: check_presence(vehicle_det[:vehicle1]),
                                               number: vehicle_det[:vehicle2],
                                               accident_on: vehicle_det[:accident_date])
     end
  end

  def create_case_information(kase)
     kase_info = CaseInformation.find_or_initialize_by(case_id: kase.id)
     kase_info.class_code = data[:class_code]
     kase_info.date_given_by = data[:date_given_by]
     kase_info.case_bench = sanitize(data[:case_bench])
     kase_info.court_number = data[:court_no]
     kase_info.sr_number = data[:sr_no] rescue nil
     kase_info.stamp_number = data[:stamp_no] rescue nil
     kase_info.storage_id = data[:storage_id]
     kase_info.snapshot_url = data[:snapshot_url]
     kase_info.nature_of_disposal = sanitize(data[:nature_of_disposal])
     kase_info.token_number = data[:token_no]
     kase_info.disposal_type = data[:disposal_type]
     kase_info.dispose_by_judge = sanitize(data[:dispose_by_judge])
     kase_info.stamp_or_register = data[:stamp_or_register]
     kase_info.posted = sanitize(data[:posted])
     kase_info.last_action = data[:last_action]
     kase_info.classification_number = data[:classfication_no]
     kase_info.purpose = sanitize(data[:purpose])
     kase_info.diary_number = data[:diary_no]
     kase_info.peti_resp_number = data[:pr_no]
     kase_info.sub_category = sanitize(data[:sub_category])
     kase_info.sub_sub_category = sanitize(data[:sub_sub_category])

     if kase_info.new_record?
       kase_info.save
     end
  end

  def create_department(kase)
    data[:department_details].each do |department_det|
      dept_details = Department.find_or_initialize_by(case_id: kase.id)
      dept_details.dept_type = sanitize(department_det[:type])
      dept_details.code = department_det[:code]
      dept_details.name = sanitize(department_det[:name])

      if dept_details.new_record?
        dept_details.save
      end
      end
  end

  def create_paper(kase)
     data[:paper_details].each do |paper_det|
       paper = kase.papers.find_or_create_by!(number: paper_det[:number],
                                                 paper_type: sanitize(paper_det[:type]),
                                                 filed_at: paper_det[:filing_date])
      end
     end

   def create_court_detail(kase)
     data[:court_details].each do |court_det|
       court_details = CourtDetail.find_or_create_by(case_number: check_presence(court_det[:case_no]),
                                                      court_name: sanitize(court_det[:court_name]),
                                                      ordered_at: court_det[:order_date])

     case_court_detail = court_details.case_court_details.find_or_create_by!(case_id: kase.id, court_detail_id: court_details.id)
     end
   end

  def create_act(source, kase)
     if source == "act"
       act = Act.find_or_initialize_by(act: sanitize(data[:act]))
       if data.has_key?(:under_section)
         act.section = sanitize(data[:under_section])
         if act.new_record?
           act.save
           create_case_act(act,kase)
         end
       else
         actString = sanitize(data[:act])
         section = actString.gsub(/\D/, '')
         act.section = section
         if act.new_record?
           act.save
           create_case_act(act,kase)
         end
       end
     end
     if source == "act_details"
         ad = data[:act_details][0]
         act = Act.find_or_initialize_by(act: sanitize(ad[:act]), section: sanitize(ad[:section]))
         if act.new_record?
           act.save
           create_case_act(act,kase)
         end
     end
  end

  def create_case_status_param(kase)

    casestatus_params = CasestatusParam.find_or_initialize_by(case_id: kase.id)
    if data.has_key?(:casestatus_param)
      casestatus_params.case_year = data[:casestatus_param][:case_year]
      casestatus_params.case_number = data[:casestatus_param][:case_no]
      casestatus_params.case_type = sanitize(data[:casestatus_param][:case_type])
      casestatus_params.main_case = data[:casestatus_param][:main_case]
      casestatus_params.source = sanitize(data[:casestatus_param][:source])
      casestatus_params.country = sanitize(data[:casestatus_param][:country])
    end

    if data.has_key?(:param)
      casestatus_params.param = data[:param]
    end

    if data.has_key?(:ct_val)
      casestatus_params.ct_val = data[:ct_val]
    end

    if data.has_key?(:extra_param)
      casestatus_params.extra_param = data[:extra_param]
    end
    if casestatus_params.new_record?
      casestatus_params.save
    end
  end

  def create_fir_detail()
    data[:fir_details].each do |fir_det|
       fir_detail = FirDetail.find_or_create_by!(fir_number: fir_det[:fir_no],
                                                district: sanitize(fir_det[:district]),
                                                place: sanitize(fir_det[:place]))
       @fir_detail = fir_detail
      end
    end

  def create_other()
    other = Other.find_or_create_by!(uri: data[:others])
    @other = other
  end

  def create_lower_court_detail(kase)
    data[:lower_court_details].each do |lower_court_det|
                 lower_court_details = kase.lower_court_details.find_or_initialize_by(case_number: check_presence(lower_court_det[:case_no]))
                 lower_court_details.judgeship = sanitize(lower_court_det[:judgeship])
                 lower_court_details.place = sanitize(lower_court_det[:place])
                 lower_court_details.court = sanitize(lower_court_det[:court])
                 lower_court_details.decision_at = lower_court_det[:decision_date]

                 if lower_court_details.new_record?
                 lower_court_details.save
                 end
        end
  end

def create_vakalat_advocate(kase)
   data[:vakalath_details].each do |vd|
           advokate = Advocate.find_or_initialize_by(code: vd[:advocate_code])
           if vd.has_key?(:advocate_name)
            advokate.name = sanitize(vd[:advocate_name])
            if advokate.new_record?
             advokate.save
            end
           end
           create_case_advocate(advokate,kase)
         end
   end

 def create_sub_case(kase)
  data[:sub_case_details].each do |sub_case_det|
        sub_case_detail = SubCase.find_or_create_by!(case_id: kase.id, sub_case_type: check_presence(sub_case_det[:type]),
                                                  sub_case_number: check_presence(sub_case_det[:case_no]))
     end
  end

  def print(arr)
    arr.each do |record|
      data = record.with_indifferent_access
      @data = data
      location = Location.find_or_create_by!(state: sanitize(data[:state]), district: sanitize(data[:district]))

      court_grp = location.court_groups.find_or_create_by!(court_name: sanitize(data[:source]), court_type: sanitize(data[:type]), bench: sanitize(data[:bench]))
      @court_grp = court_grp

      city = location.cities.find_or_create_by!(name: sanitize(data[:district]))

      create_other() if data.has_key?(:others)

      create_fir_detail() if data.has_key?(:fir_details)

      kase = create_case()

      create_judges(kase) if data.has_key?(:judges)

      if data.has_key?(:act)
        source = "act"
        create_act(source, kase)
      elsif data.has_key?(:act_details)
        source = "act_details"
        create_act(source, kase)
      end

      if data.has_key?(:petitioners)
        data[:petitioners].each do |p|
          adv = create_advocate_party(p,"petitioner",kase)
        end

      end
      if data.has_key?(:respondents)
        data[:respondents].each do |r|
          adv = create_advocate_party(r,"respondent",kase)
        end
      end

      create_vakalat_advocate(kase) if data.has_key?(:vakalath_details)

      create_case_information(kase)

      create_case_detail(:case_details, kase) if data.has_key?(:case_details)
      create_case_detail(:filing_details, kase) if data.has_key?(:filing_details)

      create_vehicle(:vehicle_details, kase) if data.has_key?(:vehicle_details)

      create_department(kase) if data.has_key?(:department_details)

        create_paper(kase)  if data.has_key?(:paper_details)

      create_order(:order_details,kase,"regular") if data.has_key?(:order_details)

        create_order(:daily_orders,kase,"daily") if data.has_key?(:daily_orders)

        create_order(:final_orders,kase,"final")  if data.has_key?(:final_orders)

        order = Order.find_or_create_by!(latest_order: sanitize(data[:order]), case_id: kase.id, order_type: "daily") if data.has_key?(:order)

      create_lower_court_detail(kase) if data.has_key?(:lower_court_details)

      create_case_status_param(kase)

     create_sub_case(kase) if data.has_key?(:sub_case_details)


     create_associated_case("main_matter",kase, :main_matter_details) if data.has_key?(:main_matter_details)

     create_associated_case("connected_case",kase, :connected_case_details) if data.has_key?(:connected_case_details)

     create_ia_details(:interlocutory_applications,kase) if data.has_key?(:interlocutory_applications)

     create_ia_details(:ia_details,kase) if data.has_key?(:ia_details)

     create_usr_detail(kase) if data.has_key?(:usr_details)

     create_history(:case_history,kase) if data.has_key?(:case_history)

     create_history(:case_hearing_details,kase) if data.has_key?(:case_hearing_details)

     create_court_detail(kase) if data.has_key?(:court_details)

    end
  end
end
