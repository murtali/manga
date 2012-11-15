class ChaptersController < ApplicationController

	def index
		@chapters = Chapter.all
	end

	def new
		@manga = Manga.find_by_slug(params[:manga_id])
		@chapter = Chapter.new
	end

	def create
		@manga = Manga.find_by_slug(params[:manga_id])
		@chapter = @manga.chapters.create!(params[:chapter])
		redirect_to manga_path(@manga)
	end

	def show
		@chapter = Chapter.find(params[:id])
	end

end

