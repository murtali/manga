class PagesController < ApplicationController
  def new
  	@page = Page.new(:chapter_id => params[:chapter_id])
  end

  def create
  	@page = Page.create!(params[:page])
  	redirect_to manga_chapter_path(@page.chapter.manga, @page.chapter)
  end

  def edit
  end

  def destroy
  end
end
