class ChaptersController < ApplicationController

	def index
		@chapters = Chapter.all
	end

	def new
		@manga = Manga.find_by_slug(params[:manga_id])
		@chapter = Chapter.new
	end

	def create
		@chapter = Chapter.new(params[:chapter])
		@chapter.save
		redirect_to manga_path(@chapter)
	end

end

