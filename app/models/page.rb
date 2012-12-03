class Page < ActiveRecord::Base
  belongs_to :chapter
  attr_accessible :name, :chapter_id, :image
  mount_uploader :image, ImageUploader
  before_create :default_name


	def default_name
    self.name ||= File.basename(image.filename, '.*') if image
  end

end