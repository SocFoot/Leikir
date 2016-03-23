class Contact < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "150x150>", thumb: "70x70>" }
  
  validates :nom, presence: true
  validates :prenom, presence: true
  validates :email, presence: true
  validates :image, presence: true
  
  # Validate content type
  validates_attachment_content_type :image, content_type: ["image/jpeg", "image/png"]
  
  # Validate filename
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]
end
