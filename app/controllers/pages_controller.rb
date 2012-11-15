class PagesController < ApplicationController
  


  def index
    @pages = Pages.all
    render :json => @pictures.collect { |p| p.to_jq_upload }.to_json
  end

  def new
  	@page = Page.new(:chapter_id => params[:chapter_id])
  end

  # def create
  # 	@page = Page.create!(params[:page])
  # 	redirect_to manga_chapter_path(@page.chapter.manga, @page.chapter)
  # end


  def create
    p_attr = params[:page]
    p_attr[:image] = params[:page][:image].first if params[:page][:image].class == Array

    @page = Page.new(p_attr)
    if @page.save
      respond_to do |format|
        format.html {  
          render :json => [@page.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => [@page.to_jq_upload].to_json			
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  	# redirect_to manga_chapter_path(@page.chapter.manga, @page.chapter)
  end


  def edit
  end

  def destroy
  end
end
