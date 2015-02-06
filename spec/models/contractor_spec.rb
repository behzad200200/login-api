require 'rails_helper'

RSpec.describe Contractor, :type => :model do
  describe 'attributes methods' do
    let!(:contractor_without_job_roles){create :contractor}
    let!(:contractor_with_job_roles){create :contractor_with_job_roles}

    describe '#job_roles_attributes' do
      it 'returns correct type' do
        expect(contractor_with_job_roles.job_roles_attributes).
            to be_a Array
      end
      it "returns empty hash for contractor without job_roles" do``
      expect(contractor_without_job_roles.job_roles_attributes).
          to eq([])
      end
      it 'returns all job attributes for contractor with job roles' do
        expect(contractor_with_job_roles.job_roles_attributes).
            to include(contractor_with_job_roles.job_roles.first.attributes)
      end
    end

    describe "#user_attributes" do
      it 'return correct type' do
        expect(contractor_with_job_roles.user_attributes).
            to be_a Hash
      end
      it 'returns empty hash for contractor without user' do
        contractor_with_job_roles.user = nil
        expect(contractor_with_job_roles.user_attributes).
            to eq({})
      end
      it 'returns user attributes for contractor' do
        expect(contractor_with_job_roles.user_attributes).
            to eq(contractor_with_job_roles.user.attributes)
      end
    end

    describe 'update with json data' do
      let!(:json_data){JSON.parse(contractor_with_job_roles.json_response
                                  )}
      it 'to_json should return appropriate data format for update contractor', focus: true do
        expect{contractor_with_job_roles.update(json_data)}.not_to raise_error
      end

      it 'contractor is updated with json file' do
        json_data['first_name'] = 'john'
        contractor_with_job_roles.update(json_data)
        expect(contractor_with_job_roles.first_name).to eq('john')
      end

      it 'check status' do
      end

    end

  end


end
