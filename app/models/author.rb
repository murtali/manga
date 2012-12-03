class Author < ActiveRecord::Base
  attr_accessible :name
  has_many :mangas

  validates_presence_of :name
  
end
