class Chapter < ActiveRecord::Base
  belongs_to :manga
  attr_accessible :title
  has_many :pages #aka scanalated pages
end
