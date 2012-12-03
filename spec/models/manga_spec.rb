require 'spec_helper'

describe Manga do 
	let!(:manga) { FactoryGirl.create(:manga) }

	describe "creating new manga" do
		it { should validate_presence_of :name }
		it { should validate_presence_of :author_id }
		it { should belong_to :author }
		it { should have_many :chapters }

		it "parametize the name" do
			manga.slug.should eq "naruto-something"		  
		end
	end



end