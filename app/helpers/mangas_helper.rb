module MangasHelper

	def rating(manga)
		Rating.where("manga_id = ?", manga.id).first.rating
	end

end
