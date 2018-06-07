class CaseStatusScript

  def adv_party_case_func(p,category,kase)
    advocate = Advocate.find_or_initialize_by(name: p[:advocate])

    #advocate.code = data[:vakalath_details][:advocate_code]
    advocate.save
    case_adv_func(advocate,kase)

    party = Party.find_or_initialize_by(name: p[:name],address: p[:address])
    party.save

    advocate_party = advocate.advocate_parties.find_or_initialize_by(party_id: party.id, category: category)
    advocate_party.save

    case_party = party.case_parties.find_or_initialize_by(category: category, case_id: kase.id)
    case_party.save
    return advocate
  end

  def case_adv_func(adv,kase)
    kase_adv = adv.case_advocates.find_or_initialize_by(case_id: kase.id)
    kase_adv.save
  end

  def case_details_func(kase_details,data)
    if data.has_key?(:case_details)
      data[:case_details].each do |case_det|
        kase_details.case_number = case_det[:case_no]
        kase_details.registered_on = case_det[:register_date]
        kase_details.filing_number = case_det[:filling_no]
        kase_details.filed_at = case_det[:filing_date]
        kase_details.save
      end
    else
      kase_details.save
    end
  end
=begin
  def usr_det_func()
    if data.has_key?(:usr_details)
        data[:usr_details].each do |ud|
          usr_det = adv.usr_details.find_or_initialize_by()
          usr_det.usr_number = ud[:number]
          usr_det.usr_type = ud[:type]
          usr_det.filed_at = ud[:filing_date]
        end
    end
  end
=end

    def print(data)

      location = Location.find_or_initialize_by(state: data[:state], district: data[:district])
      location.save

      #loc = Location.last

      court_grp = location.court_groups.find_or_initialize_by(court_name: data[:source], court_type: data[:type], bench: data[:bench])
      court_grp.save

      city = location.cities.find_or_initialize_by(name: data[:district])
      city.save

      #cgrp = CourtGroup.last

      j1 = data[:judges][0]
      j1[:name]
      judge = Judge.find_or_initialize_by(name: j1[:name])
      judge.save

      #jud = Judge.last

      arr = []
      data[:others].each do |o|
        arr << o
      end
      other = Other.find_or_initialize_by(uri: arr)
      other.save

      #binding.pry

      fir_detail = FirDetail.find_or_initialize_by(fir_number: data[:fir_no], district: data[:district], place: data[:place])
      fir_detail.save


      kase = Case.find_or_initialize_by(case_type: data[:case_type])
      kase.case_number = data[:case_no]
      kase.year = data[:case_year]
      kase.status = data[:case_status]
      kase.filing_number = data[:filing_no]
      kase.filed_at = data[:filing_date]
      kase.register_number = data[:register_no]
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
      kase.category = data[:category]
      kase.side = data[:side]
      kase.case_stage = data[:case_stage]
      kase.csp = data[:csp_id]
      kase.flag = "updated"
      kase.court_group_id = court_grp.id
      kase.fir_detail_id = fir_detail.id
      kase.judge_id = judge.id
      kase.other_id = other.id

      kase.save

      if data.has_key?(:act)
        puts data[:act]
        act = Act.find_or_initialize_by(act: data[:act])
        if data.has_key?(:under_section)
          act.section = data[:under_section]
        else
          actString = data[:act]
          section = actString.gsub(/\D/, '')
          act.section = section
          act.save
        end
      elsif data.has_key?(:act_details)
        ad = data[:act_details][0]
        act = Act.find_or_initialize_by(act: ad[:act], section: ad[:section])
        act.save
      end

      case_act = act.case_acts.find_or_initialize_by(case_id: kase.id)
      case_act.save

      #insert into Advocate, Party, AdvocateParty modules

      if data.has_key?(:petitioners)
        data[:petitioners].each do |p|
          category = "petitioner"
          adv = adv_party_case_func(p,category,kase)
        end

        #usr_details_func(adv)
      end
      if data.has_key?(:respondents)
        data[:respondents].each do |r|
          category = "respondent"
          adv = adv_party_case_func(r,category,kase)
        end
      end

      if data.has_key?(:vakalath_details)
        data[:vakalath_details].each do |vd|
          advokate = Advocate.find_or_initialize_by(name: vd[:advocate_name])
          advokate.code = vd[:advocate_code]
          advokate.save
          case_adv_func(advokate,kase)
        end
      end

      kase_info = CaseInformation.find_or_initialize_by(case_id: kase.id)
      kase_info.class_code = data[:class_code]
      kase_info.date_given_by = data[:date_given_by]
      kase_info.case_bench = data[:case_bench]
      kase_info.court_number = data[:court_no]
      kase_info.sr_number = data[:sr_no]
      kase_info.stamp_number = data[:stamp_no]
      kase_info.storage_id = data[:storage_id]
      kase_info.snapshot_url = data[:snapshot_url]
      kase_info.nature_of_disposal = data[:nature_of_disposal]
      kase_info.token_number = data[:token_no]
      kase_info.disposal_type = data[:disposal_type]
      kase_info.dispose_by_judge = data[:dispose_by_judge]
      kase_info.stamp_or_register = data[:stamp_or_register]
      kase_info.posted = data[:posted]
      kase_info.last_action = data[:last_action]
      kase_info.classification_number = data[:classfication_no]
      kase_info.purpose = data[:purpose]
      kase_info.diary_number = data[:diary_no]
      kase_info.peti_resp_number = data[:pr_no]
      kase_info.sub_category = data[:sub_category]
      kase_info.sub_sub_category = data[:sub_sub_category]

      kase_info.save

      if data.has_key?(:court_details)
        data[:court_details].each do |court_det|
          court_details = CourtDetail.find_or_initialize_by(case_number: court_det[:case_no])
          court_details.court_name = court_det[:court_name]
          court_details.ordered_at = court_det[:order_date]
          court_details.save

          case_court_det = court_details.case_court_details.find_or_initialize_by(case_id: kase.id)
          case_court_det.save
        end
      else
        court_details = CourtDetail.find_or_initialize_by()
        court_details.save
        case_court_det = court_details.case_court_details.find_or_initialize_by(case_id: kase.id)
        case_court_det.save
      end

      if data.has_key?(:vehicle_details)
        data[:vehicle_details].each do |vehicle_det|
          vehikle = Vehicle.find_or_initialize_by(case_id: kase.id)
          vehikle.vehicle = vehicle_det[:vehicle1]
          vehikle.number = vehicle_det[:vehicle2]
          vehikle.accident_on = vehicle_det[:accident_date]

          vehikle.save
        end
      else
        vehicle = Vehicle.find_or_initialize_by(case_id: kase.id)
        vehicle.save
      end

      if data.has_key?(:department_details)
        data[:department_details].each do |department_det|
          dept_details = Department.find_or_initialize_by(case_id: kase.id)
          dept_details.dept_type = department_det[:type]
          dept_details.code = department_det[:code]
          dept_details.name = department_det[:name]

          dept_details.save
        end
      else
        dept_details = Department.find_or_initialize_by(case_id: kase.id)
        dept_details.save
      end

      if data.has_key?(:filing_details)
        data[:filing_details].each do |filing_det|
          kase_details = kase.case_details.find_or_initialize_by(court_fees: filing_det[:court_fees])
          case_details_func(kase_details,data)
        end
      else
        kase_details = kase.case_details.find_or_initialize_by()
        case_details_func(kase_details,data)
      end

      if data.has_key?(:paper_details)
        data[:paper_details].each do |paper_det|
          paper = kase.papers.find_or_initialize_by(number: paper_det[:number],
                                                    paper_type: paper_det[:type],
                                                    filed_at: paper_det[:filing_date])
          paper.save
        end
      else
        paper = kase.papers.find_or_initialize_by()
        paper.save
      end

     if data.has_key?(:order_details)
       data[:order_details].each do |order_det|
         order = kase.orders.find_or_initialize_by(number: order_det[:number],
                                                   paper_type: order_det[:type],
                                                   filed_at: order_det[:filing_date])
         order.save
       end
      else
        order = kase.orders.find_or_initialize_by()
        order.save
     end

  end
end
