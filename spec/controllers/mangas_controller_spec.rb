require 'spec_helper'

describe MangasController do

  let(:manga) { FactoryGirl.create(:manga) }

  # let(:chapter) { FactoryGirl.create(:chapter) }


  describe "#new" do
    it "assigns a new manga instance" do
      get(:new)
      assigns(:manga).should be_new_record
    end
  end

	describe'#show'do
		it "assigns the requested manga" do
			manga = create(:manga)
			get :show, id_or_slug: manga 
			assigns(:manga).should eq manga
		end
		
		it "renders the :show template" do 
			manga = create(:manga)
			get :show, id_or_slug: manga 
			response.should render_template :show
		end 
	end


  describe "#create" do

    context "when the manga is valid" do
      let!(:manga_attrs) {{:name => manga.name, :author => manga.author}}

      it "saves the new manga" do
      	expect{
      		post(:create, :manga => manga_attrs)
      		}.to change(Manga, :count).by(1)
      end

      it "redirects to manga index page" do
        post(:create, :manga => manga_attrs)
        response.should redirect_to(mangas_path)
      end

    end

    context "when the manga is not valid" do
    	let!(:invalid_manga_attrs) {{:name => nil, :author => nil}}

      it "renders new" do
        post(:create, :manga => invalid_manga_attrs)
        response.should render_template('mangas/new')
      end
    end

  end

end
