require 'spec_helper'

describe Chapter do
	let(:manga) 	{ FactoryGirl.create(:manga) 		}
	let(:chapter)	{ FactoryGirl.create(:chapter, :manga_id => manga.id)	}

	describe "chapter create" do
		it { should validate_presence_of :title }
		it { should validate_presence_of :manga_id }
		it { should have_many :pages }
		it { should belong_to :manga }

		it "should belong to the correct manga id" do
			chapter.manga_id.should eq manga.id
		end
	end

end