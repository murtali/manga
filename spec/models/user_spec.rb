require 'spec_helper'

describe User do

	let!(:user) { FactoryGirl.create(:user) }
	
  context "#email" do
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :email }
  end

end