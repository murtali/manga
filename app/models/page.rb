class Page < ActiveRecord::Base
  belongs_to :chapter
  attr_accessible :name, :chapter_id, :image
  mount_uploader :image, ImageUploader
  before_create :default_name


	def default_name
    self.name ||= File.basename(image.filename, '.*') if image
  end

  def page_number
  	self.name.match(/\d+\D+(\d+.+)/) { $1 }
  end

end