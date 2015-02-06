FactoryGirl.define do
  factory :contractor do
    first_name 'tom'
    last_name 'banikarimi'
    street 'pit'
    state 'NSW'
    mobile_phone '09123057740'
    suburb 'Redfern'
    user


    factory :contractor_with_job_roles do

      transient do
        job_roles_count 5
      end

      after(:create) do |contractor, evaluator|
        create_list(:job_role, evaluator.job_roles_count, contractor: contractor)
      end
    end

  end
end