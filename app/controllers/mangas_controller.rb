class MangasController < ApplicationController
  def index
  	@mangas = Manga.all
  end

  def new
  	@manga = Manga.new
  end

  def create
  	@manga = Manga.new(params[:manga])
  	@manga.save
  	redirect_to mangas_path
  end

  def show
    if params[:id_or_slug] =~ /^\d+$/
      @manga = Manga.includes(:chapters).find(params[:id_or_slug])
    else
      @manga = Manga.includes(:chapters).find_by_slug(params[:id_or_slug])
    end
  end


end
