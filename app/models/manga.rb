class Manga < ActiveRecord::Base
  before_create :create_slug
  belongs_to :author
  has_many :chapters
  has_many :ratings
  attr_accessible :name, :synopsis, :ratings, :average_rating
  attr_protected :slug

  validates_presence_of :name, :author_id

  def to_param
  	slug
  end

  def create_slug
  	self.slug = name.parameterize
  end

  def self.create_with_author!(options = {})
    Manga.transaction do
      author = Author.find_or_create_by_name!(:name => options[:author_name])
      manga = author.mangas.create!(:name => options[:manga_name])
    end
    rescue
  end

  def average_rating
    return 0 if !self.ratings.any?
    total = 0
    self.ratings.each do |rating|
      total += rating.rating
    end
    (total/self.ratings.length)
  end
  

end
