class Request < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments, :dependent => :destroy

	has_attached_file :image, styles: { medium: "500x300#", small: "250x150>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	acts_as_votable

  	# attr_accessor :image
  	 attr_accessor :image_file_name

end
