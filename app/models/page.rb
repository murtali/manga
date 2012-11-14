class Page < ActiveRecord::Base
  belongs_to :chapter
  attr_accessible :name, :chapter_id
end
