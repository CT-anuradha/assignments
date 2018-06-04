class CaseStatusScript

def func(p,category,c)

  advocate = Advocate.find_or_initialize_by(name: p[:advocate])
  advocate.save

  party = Party.find_or_initialize_by(name: p[:name],address: p[:address])
  party.save

  advocate_party = advocate.advocate_parties.find_or_initialize_by(party_id: party.id, category: category)
  advocate_party.save

  case_party = party.case_parties.find_or_initialize_by(category: category, case_id: c.id)
  case_party.save
end

=begin
  def party_advocate(data,c)
    if data.has_key?(:petitioners)
      data[:petitioners].each do |p|
           p_advocate = Advocate.find_or_initialize_by(name: p[:advocate])
           p_advocate.save

           p_party = Party.find_or_initialize_by(name: p[:name],address: p[:address])
           p_party.save

           p_advocate_party = p_advocate.advocate_parties.find_or_initialize_by(party_id: p_party.id, category: "petitioner")
           p_advocate_party.save

           p_case_party = p_party.case_parties.find_or_initialize_by(category: "petitioner", case_id: c.id)
           p_case_party.save
          end
    end
    if data.has_key?(:respondents)
      data[:respondents].each do |r|
        r_advocate = Advocate.find_or_initialize_by(name: r[:advocate])
        r_advocate.save

        r_party = Party.find_or_initialize_by(name: r[:name],address: r[:address])
        r_party.save

        r_advocate_party = r_advocate.advocate_parties.find_or_initialize_by(party_id: r_party.id, category: "respondent")
        r_advocate_party.save

        r_case_party = r_party.case_parties.find_or_initialize_by(category: "respondent", case_id: c.id)
        r_case_party.save
      end
    end
  end
=end

  def print(data)

#puts data[:bench]


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
    #oth = Other.last

    ext_params = other.extra_params.find_or_initialize_by(m_fil_no: data[:extra_param][:m_fil_no], m_reg_no: data[:extra_param][:m_reg_no])
    ext_params.save

    c = Case.find_or_initialize_by(case_type: data[:case_type])
    c.case_number = data[:case_no]
    c.year = data[:case_year]
    c.status = data[:case_status]
    c.filing_number = data[:filing_no]
    c.filed_at = data[:filing_date]
    c.register_number = data[:register_no]
    c.registered_on = data[:register_date]
    c.cnr = data[:cnr_no]
    c.first_hearing = data[:first_hearing]
    c.decision_at = data[:decision_date]
    c.next_hearing = data[:next_hearing]
    c.last_hearing = data[:last_hearing]
    c.presented_on = data[:presentation_date]
    c.update_at = data[:update_date]
    c.service_at = data[:service_date]
    c.notice_issued_at = data[:notice_issue_date]
    c.disposed_on = data[:disposal_date]
    c.ordered_at = data[:order_date]
    c.judgement_at = data[:judgement_date]
    c.category = data[:category]
    c.side = data[:side]
    c.case_stage = data[:case_stage]
    c.csp = data[:csp_id]
    c.flag = "updated"
    c.court_group_id = court_grp.id
    #c.fir_detail_id =
    c.judge_id = judge.id
    c.other_id = other.id

    c.save

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

     case_act = act.case_acts.find_or_initialize_by(case_id: c.id)
     case_act.save

     #insert into Advocate, Party, AdvocateParty modules

     if data.has_key?(:petitioners)
        data[:petitioners].each do |p|
        category = "petitioner"
        func(p,category,c)
        end
      end
     if data.has_key?(:respondents)
        data[:respondents].each do |r|
        category = "respondent"
        func(r,category,c)
        end
     end

  end
end

