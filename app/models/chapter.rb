class Chapter < ActiveRecord::Base
  belongs_to :manga
  attr_accessible :title, :manga_id
  has_many :pages #aka scanalated pages
end
