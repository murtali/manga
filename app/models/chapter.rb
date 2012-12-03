class Chapter < ActiveRecord::Base
  belongs_to :manga
  attr_accessible :title, :manga_id
  has_many :pages #aka scanalated pages

  validates_presence_of :title, :manga_id
  validates_associated :manga
end
