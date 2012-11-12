class Manga < ActiveRecord::Base
  before_create :create_slug
  belongs_to :author
  has_many :chapters
  attr_accessible :name
  attr_protected :slug


  def to_param
  	slug
  end

  def create_slug
  	self.slug = name.parameterize
  end

end
