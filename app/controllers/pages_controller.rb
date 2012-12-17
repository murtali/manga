class PagesController < ApplicationController

  def index
    @pages = Pages.all
  end


  def create
    @page = Page.create(params[:page])
    render :json => {:success => true, :chapter_pages => render_to_string(:partial => 'chapters/chapter_pages', :locals => {:chapter => @page.chapter}) }  
  end


  def edit
  end

  def destroy
    @page = Page.find(params[:id])
    pagename = @page.name
    @page.delete
    render :json => { :success => true, :pagename => pagename }
  end

end
