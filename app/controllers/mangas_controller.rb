class MangasController < ApplicationController
  before_filter :get_manga, :only => [:update, :edit, :destroy]

  def index
  	@mangas = Manga.all
  end

  def new
  	@manga = Manga.new
  end

  def create
    if @manga = Manga.create_with_author!(:manga_name => params[:manga][:name],
                  :author_name => params[:manga][:author])
      flash[:notice] = "Succesfully added manga."
      redirect_to mangas_path
    else
      flash[:error] = "The author or manga fields cannot be left blank."
      render "new"
    end

  end

  def show
    if params[:id_or_slug] =~ /^\d+$/
      @manga = Manga.includes(:chapters).find(params[:id_or_slug])
    else
      @manga = Manga.includes(:chapters).find_by_slug(params[:id_or_slug])
    end
  end

  def update
    @manga.update_attributes!(params[:manga])
    redirect_to edit_manga_path(@manga)
  end


  def edit
  end

  def destroy
    @manga.delete
    redirect_to root_path
  end

  def rate
    @mangas = Manga.all
    manga, rating = params[:manga_rating].split("_")
    @manga = Manga.find_by_slug(manga)
    @rating = @manga.ratings.find_by_user_id(current_user.id)
    if @rating
      @rating.update_attributes(:user_id => current_user.id, :manga_id => @manga.id, :rating => rating.to_i)
    else
      @manga.ratings.create!(:user_id => current_user.id, :manga_id => @manga.id, :rating => rating.to_i)
    end
    render 'index'
  end

  private

  def get_manga
    @manga = Manga.find_by_slug(params[:id_or_slug])
  end

end
