require 'date'
FactoryGirl.define do
  factory :job_role do
    transient do
      end_point {DateTime.now.to_date}
    end

    contractor
    title 'Developer'
    sequence(:end_date){|n| end_point.prev_year((n-1)*2)}
    start_date {end_date.prev_year}
  end
end