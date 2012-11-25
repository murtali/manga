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
		redirect_to edit_manga_path(@manga)
	end

	def update
		@manga = Manga.find_by_slug(params[:manga_id])
		@chapter = Chapter.find(params[:id])
		@chapter.update_attributes(params[:chapter])
		redirect_to edit_manga_chapter_path(@manga,@chapter)
	end

	def show
		@chapter = Chapter.find(params[:id])
		@manga = Manga.find_by_slug(params[:manga_id])
	end

	def edit
		@manga = Manga.find_by_slug(params[:manga_id])
		@chapter = Chapter.find(params[:id])
	end

	def destroy
		@manga = Manga.find_by_slug(params[:manga_id])
		@chapter = Chapter.find(params[:id])
		@chapter.delete
		redirect_to edit_manga_path(@manga.slug)
	end

end

