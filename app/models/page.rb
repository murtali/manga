class Page < ActiveRecord::Base
  belongs_to :chapter
  attr_accessible :name, :chapter_id, :image
  mount_uploader :image, ImageUploader
  before_create :default_name


	def default_name
    self.name ||= File.basename(image.filename, '.*') if image
  end

  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      # "thumbnail_url" => image.thumb.url,
      "delete_url" => Rails.application.routes.url_helpers.page_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end

end
