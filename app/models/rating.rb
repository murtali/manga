class Rating < ActiveRecord::Base

	belongs_to :manga
	belongs_to :user

	attr_accessible :user_id, :manga_id, :rating
	validates_uniqueness_of :user_id, :scope => [:manga_id, :rating]
	validates_uniqueness_of :manga_id, :scope => [:user_id, :rating]
	
end

