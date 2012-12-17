class Chapter < ActiveRecord::Base
  belongs_to :manga
  attr_accessible :title, :manga_id
  has_many :pages #aka scanalated pages

  validates_presence_of :title, :manga_id
  validates_associated :manga

  def sorted_pages
  	self.pages.sort_by do |s|
  		s.name =~ /\d+\D+(\d+)/ ? $1 : s
		end
  end
end
